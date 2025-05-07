#--------------
# Bastion Host
#--------------
resource "azurerm_bastion_host" "bastion_host" {
  name                = var.bastion_host_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  tunneling_enabled   = var.tunneling_enabled

  ip_configuration {
    name                 = var.ip_configuration_name
    subnet_id            = var.subnet_id
    public_ip_address_id = var.public_ip_address_id
  }

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
data "azurerm_monitor_diagnostic_categories" "bastion_host_diagnostic_categories" {
  resource_id = azurerm_bastion_host.bastion_host.id
}

resource "azurerm_monitor_diagnostic_setting" "bastion_host_diagnostic_setting" {
  count                          = var.enable_diagnostic_settings == true ? 1 : 0
  name                           = "diag-${azurerm_bastion_host.bastion_host.name}"
  target_resource_id             = azurerm_bastion_host.bastion_host.id
  log_analytics_workspace_id     = var.law_id
  log_analytics_destination_type = try(var.log_analytics_destination_type)

  dynamic "enabled_log" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.bastion_host_diagnostic_categories.log_category_types)

    content {
      category = enabled_log.value

      retention_policy {
        enabled = contains(var.log_category_types, enabled_log.value)
        days    = contains(var.log_category_types, enabled_log.value) == true ? var.retention_days : 0
      }
    }
  }

  dynamic "metric" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.bastion_host_diagnostic_categories.metrics)

    content {
      category = metric.value
      enabled  = contains(var.metrics, metric.value)

      retention_policy {
        enabled = contains(var.metrics, metric.value)
        days    = contains(var.metrics, metric.value) == true ? var.retention_days : 0
      }
    }
  }

  lifecycle {
    ignore_changes = [metric]
  }
}