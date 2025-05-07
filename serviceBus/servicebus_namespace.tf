#-----------------------
# Service Bus Namespace
#-----------------------
resource "azurerm_servicebus_namespace" "servicebus_ns" {
  name                = var.servicebus_ns_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku

  dynamic "identity" {
    for_each = try(var.identity.type, null) != null ? [var.identity.type] : []
    content {
      type         = var.identity.type
      identity_ids = var.identity.type == "UserAssigned" || var.identity.type == "SystemAssigned, UserAssigned" ? var.identity.identity_ids : null
    }
  }

  capacity                     = try(var.capacity, null)
  premium_messaging_partitions = try(var.premium_messaging_partitions, null)

  dynamic "customer_managed_key" {
    for_each = try(var.customer_managed_key, {}) != {} ? [var.customer_managed_key] : []
    content {
      key_vault_key_id                  = customer_managed_key.value.key_vault_key_id
      identity_id                       = customer_managed_key.value.identity_id
      infrastructure_encryption_enabled = lookup(customer_managed_key.value, "infrastructure_encryption_enabled", null)
    }
  }

  local_auth_enabled            = try(var.local_auth_enabled, true)
  public_network_access_enabled = try(var.public_network_access_enabled, true)
  minimum_tls_version           = try(var.minimum_tls_version, 1.2)

  dynamic "network_rule_set" {
    for_each = try(var.network_rule_set, {}) != {} ? [var.network_rule_set] : []
    content {
      default_action                = lookup(network_rule_set.value, "default_action", "Allow")
      public_network_access_enabled = lookup(network_rule_set.value, "public_network_access_enabled", "Allow")
      trusted_services_allowed      = lookup(network_rule_set.value, "trusted_services_allowed", null)
      ip_rules                      = lookup(network_rule_set.value, "ip_rules", null)
      dynamic "network_rules" {
        for_each = length(keys(lookup(network_rule_set.value, "network_rules", {}))) > 0 ? lookup(network_rule_set.value, "network_rules", {}) : {}
        content {
          subnet_id                            = network_rules.value.subnet_id
          ignore_missing_vnet_service_endpoint = lookup(network_rules.value, "ignore_missing_vnet_service_endpoint", null)
        }
      }
    }
  }

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}