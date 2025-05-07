#---------------------
# Diagnostic Settings
#---------------------
data "azurerm_monitor_diagnostic_categories" "servicebus_ns_diagnostic_categories" {
  resource_id = azurerm_servicebus_namespace.servicebus_ns.id
}

resource "azurerm_monitor_diagnostic_setting" "servicebus_ns_diagnostic_setting" {
  count                          = var.enable_diagnostic_settings == true ? 1 : 0
  name                           = "diag-${azurerm_servicebus_namespace.servicebus_ns.name}"
  target_resource_id             = azurerm_servicebus_namespace.servicebus_ns.id
  log_analytics_workspace_id     = var.law_id
  log_analytics_destination_type = try(var.log_analytics_destination_type)

  dynamic "enabled_log" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.servicebus_ns_diagnostic_categories.log_category_types)

    content {
      category = enabled_log.value

      retention_policy {
        enabled = true
      }
    }
  }

  dynamic "metric" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.servicebus_ns_diagnostic_categories.metrics)

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