#-------------------
# App Configuration
#-------------------
resource "azurerm_app_configuration" "app_configuration" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

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
data "azurerm_monitor_diagnostic_categories" "app_configuration_diagnostic_categories" {
  resource_id = azurerm_app_configuration.app_configuration.id
}

resource "azurerm_monitor_diagnostic_setting" "app_configuration_diagnostic_setting" {
  count                          = var.enable_diagnostic_settings == true ? 1 : 0
  name                           = "diag-${azurerm_app_configuration.app_configuration.name}"
  target_resource_id             = azurerm_app_configuration.app_configuration.id
  log_analytics_workspace_id     = var.law_id
  log_analytics_destination_type = try(var.log_analytics_destination_type)

  dynamic "enabled_log" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.app_configuration_diagnostic_categories.log_category_types)

    content {
      category = enabled_log.value

      retention_policy {
        enabled = true
      }
    }
  }

  dynamic "metric" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.app_configuration_diagnostic_categories.metrics)

    content {
      category = metric.value
      enabled  = contains(var.metrics, metric.value)

      retention_policy {
        enabled = true
      }
    }
  }

  lifecycle {
    ignore_changes = [metric]
  }
}