#---------------------
# Diagnostic Settings
#---------------------
data "azurerm_monitor_diagnostic_categories" "diagnostic_categories" {
  resource_id = var.resource_id
}

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  name                           = var.diagnostic_setting_name
  target_resource_id             = var.resource_id
  log_analytics_workspace_id     = var.law_id
  log_analytics_destination_type = try(var.law_type)

  dynamic "enabled_log" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.diagnostic_categories.log_category_types)

    content {
      category = enabled_log.value

      retention_policy {
        enabled = contains(var.log_category_types, enabled_log.value)
        days    = contains(var.log_category_types, enabled_log.value) == true ? var.retention_days : 0
      }
    }
  }

  dynamic "metric" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.diagnostic_categories.metrics)

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