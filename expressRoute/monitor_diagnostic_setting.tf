#-------------
# Diagnostics
#-------------
resource "azurerm_monitor_diagnostic_setting" "express_route_diagnostics" {
  name                       = var.express_route_diagnostics_name
  target_resource_id         = azurerm_express_route_circuit.express_route_circuit.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category = "PeeringRouteLog"
    retention_policy {
      days    = 30
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      days    = 30
      enabled = true
    }
  }

  lifecycle {
    ignore_changes = [
      metric,
      enabled_log,
    ]
  }
}