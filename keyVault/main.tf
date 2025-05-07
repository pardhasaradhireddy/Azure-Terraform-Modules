#-----------
# Key Vault
#-----------
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  dynamic "access_policy" {
    for_each = var.access_policy != {} ? var.access_policy : tomap({})
    content {
      tenant_id               = data.azurerm_client_config.current.tenant_id
      object_id               = access_policy.value.object_id
      application_id          = lookup(access_policy.value, "application_id", null)
      certificate_permissions = lookup(access_policy.value, "certificate_permissions", null)
      key_permissions         = lookup(access_policy.value, "key_permissions", null)
      secret_permissions      = lookup(access_policy.value, "secret_permissions", null)
      storage_permissions     = lookup(access_policy.value, "storage_permissions", null)
    }
  }

  enabled_for_deployment          = try(var.enabled_for_deployment, null)
  enabled_for_disk_encryption     = try(var.enabled_for_disk_encryption, null)
  enabled_for_template_deployment = try(var.enabled_for_template_deployment, null)
  enable_rbac_authorization       = try(var.enable_rbac_authorization, null)

  dynamic "network_acls" {
    for_each = try(var.network_acls, {}) != {} ? [var.network_acls] : []
    content {
      bypass                     = network_acls.value.bypass
      default_action             = network_acls.value.default_action
      ip_rules                   = lookup(network_acls.value, "ip_rules", null)
      virtual_network_subnet_ids = flatten([for ids, value in try(network_acls.value.subnet_details, {}) : "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${value.vnet_rg_name}/providers/Microsoft.Network/virtualNetworks/${value.vnet_name}/subnets/${value.subnet_name}"])
    }
  }

  purge_protection_enabled      = try(var.purge_protection_enabled, null)
  public_network_access_enabled = try(var.public_network_access_enabled, true)
  soft_delete_retention_days    = try(var.soft_delete_retention_days, null)

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}

#---------------------
# Diagnostic Settings
#---------------------
data "azurerm_monitor_diagnostic_categories" "key_vault_diagnostic_categories" {
  resource_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_monitor_diagnostic_setting" "key_vault_diagnostic_setting" {
  count                          = var.enable_diagnostic_settings == true ? 1 : 0
  name                           = "diag-${azurerm_key_vault.key_vault.name}"
  target_resource_id             = azurerm_key_vault.key_vault.id
  log_analytics_workspace_id     = var.law_id
  log_analytics_destination_type = try(var.log_analytics_destination_type)

  dynamic "enabled_log" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.key_vault_diagnostic_categories.log_category_types)

    content {
      category = enabled_log.value

      retention_policy {
        enabled = true
      }
    }
  }

  dynamic "metric" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.key_vault_diagnostic_categories.metrics)

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