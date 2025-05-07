#----------------------------
# Monitor Diagnostic Setting
#----------------------------
resource "azurerm_monitor_diagnostic_setting" "monitor_diagnostic_setting" {
  name                           = var.name
  target_resource_id             = var.target_resource_id
  eventhub_name                  = try(var.eventhub_name, null)
  eventhub_authorization_rule_id = try(var.eventhub_authorization_rule_id, null)

  dynamic "enabled_log" {
    for_each = length(keys(try(var.enabled_log, {}))) > 0 ? try(var.enabled_log, {}) : {}
    content {
      category       = lookup(enabled_log.value, "category", null)
      category_group = lookup(enabled_log.value, "category_group", null)
    }
  }

  log_analytics_workspace_id = try(var.log_analytics_workspace_id, null)

  dynamic "metric" {
    for_each = length(keys(try(var.metric, {}))) > 0 ? try(var.metric, {}) : {}
    content {
      category = metric.value.category
      enabled  = lookup(metric.value, "enabled", true)
    }
  }

  storage_account_id             = try(var.storage_account_id, null)
  log_analytics_destination_type = try(var.log_analytics_destination_type, null)
  partner_solution_id            = try(var.partner_solution_id, null)

  lifecycle {
    ignore_changes = [log_analytics_destination_type]
  }
}