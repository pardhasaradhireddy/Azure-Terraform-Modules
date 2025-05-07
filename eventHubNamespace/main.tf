#---------------------
# Event Hub Namespace
#---------------------
resource "azurerm_eventhub_namespace" "eventhub_ns" {
  name                 = var.eventhub_ns_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  sku                  = var.sku
  capacity             = try(var.capacity, "2")
  auto_inflate_enabled = try(var.auto_inflate_enabled, true)
  dedicated_cluster_id = try(var.dedicated_cluster_id, null)

  dynamic "identity" {
    for_each = try(var.identity.type, null) != null ? [var.identity.type] : []
    content {
      type         = var.identity.type
      identity_ids = var.identity.type == "UserAssigned" || var.identity.type == "SystemAssigned, UserAssigned" ? var.identity.identity_ids : null
    }
  }

  maximum_throughput_units = try(var.maximum_throughput_units, null)

  dynamic "network_rulesets" {
    for_each = try(var.network_rulesets, {}) != {} ? [var.network_rulesets] : []
    content {
      default_action                 = network_rulesets.value.default_action
      public_network_access_enabled  = lookup(network_rulesets.value, "public_network_access_enabled", true)
      trusted_service_access_enabled = lookup(network_rulesets.value, "trusted_service_access_enabled", null)
      dynamic "virtual_network_rule" {
        for_each = length(keys(lookup(network_rulesets.value, "virtual_network_rule", {}))) > 0 ? lookup(network_rulesets.value, "virtual_network_rule", {}) : {}
        content {
          subnet_id                                       = virtual_network_rule.value.subnet_id
          ignore_missing_virtual_network_service_endpoint = lookup(virtual_network_rule.value, "ignore_missing_virtual_network_service_endpoint", null)
        }
      }
      dynamic "ip_rule" {
        for_each = length(keys(lookup(network_rulesets.value, "ip_rule", {}))) > 0 ? lookup(network_rulesets.value, "ip_rule", {}) : {}
        content {
          ip_mask = ip_rule.value.ip_mask
          action  = lookup(ip_rule.value, "action", "Allow")
        }
      }
    }
  }

  local_authentication_enabled  = try(var.local_authentication_enabled, true)
  public_network_access_enabled = try(var.public_network_access_enabled, true)
  minimum_tls_version           = try(var.minimum_tls_version, "1.2")

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
      identity
    ]
  }
}

#---------------------
# Diagnostic Settings
#---------------------
data "azurerm_monitor_diagnostic_categories" "eventhub_ns_diagnostic_categories" {
  resource_id = azurerm_eventhub_namespace.eventhub_ns.id
}

resource "azurerm_monitor_diagnostic_setting" "eventhub_ns_diagnostic_setting" {
  count                          = var.enable_diagnostic_settings == true ? 1 : 0
  name                           = "diag-${azurerm_eventhub_namespace.eventhub_ns.name}"
  target_resource_id             = azurerm_eventhub_namespace.eventhub_ns.id
  log_analytics_workspace_id     = var.law_id
  log_analytics_destination_type = try(var.log_analytics_destination_type)

  dynamic "enabled_log" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.eventhub_ns_diagnostic_categories.log_category_types)

    content {
      category = enabled_log.value

      retention_policy {
        enabled = true
      }
    }
  }

  dynamic "metric" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.eventhub_ns_diagnostic_categories.metrics)

    content {
      category = metric.value

      retention_policy {
        enabled = true
      }
    }
  }

  lifecycle {
    ignore_changes = [metric, enabled_log]
  }
}