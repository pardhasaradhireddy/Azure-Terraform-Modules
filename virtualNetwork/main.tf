#-----------------
# Virtual Network
#-----------------
resource "azurerm_virtual_network" "virtual_network" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = ["53.112.14.68"] # Firewall Private IP

  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan
    content {
      id     = var.ddos_protection_plan.id
      enable = var.ddos_protection_plan.enable
    }
  }

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}

#---------
# Subnets
#---------
resource "azurerm_subnet" "subnet" {
  for_each = var.subnets

  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  address_prefixes     = each.value.address_prefixes
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  service_endpoints    = lookup(each.value, "service_endpoints", [])

  dynamic "delegation" {
    for_each = lookup(each.value, "delegation", {})
    content {
      name = delegation.key
      service_delegation {
        name    = delegation.value.name
        actions = delegation.value.actions
      }
    }
  }

  lifecycle {
    ignore_changes = [
      private_endpoint_network_policies,
      private_link_service_network_policies_enabled
    ]
  }
}

#---------------------
# Diagnostic Settings
#---------------------
data "azurerm_monitor_diagnostic_categories" "virtual_network_diagnostic_categories" {
  resource_id = azurerm_virtual_network.virtual_network.id
}

resource "azurerm_monitor_diagnostic_setting" "virtual_network_diagnostic_setting" {
  count                          = var.enable_diagnostic_settings == true ? 1 : 0
  name                           = "diag-${azurerm_virtual_network.virtual_network.name}"
  target_resource_id             = azurerm_virtual_network.virtual_network.id
  log_analytics_workspace_id     = var.law_id
  log_analytics_destination_type = try(var.log_analytics_destination_type)

  dynamic "enabled_log" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.virtual_network_diagnostic_categories.log_category_types)

    content {
      category = enabled_log.value

      retention_policy {
        enabled = true
      }
    }
  }

  dynamic "metric" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.virtual_network_diagnostic_categories.metrics)

    content {
      category = metric.value

      retention_policy {
        enabled = true
      }
    }
  }

  lifecycle {
    ignore_changes = [metric]
  }
}