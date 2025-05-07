#-------------------
# Dashboard Grafana
#-------------------
output "id" {
  description = "The unique identifier of the Grafana dashboard."
  value       = azurerm_dashboard_grafana.dashboard_grafana.id
}

output "endpoint" {
  description = "The endpoint URL of the Grafana dashboard, used to access the dashboard interface."
  value       = azurerm_dashboard_grafana.dashboard_grafana.endpoint
}

output "grafana_version" {
  description = "The version of Grafana used by the dashboard."
  value       = azurerm_dashboard_grafana.dashboard_grafana.grafana_version
}

output "identity" {
  description = "The managed identity assigned to the Grafana dashboard for secure access to other resources."
  value       = azurerm_dashboard_grafana.dashboard_grafana.identity
}

output "outbound_ip" {
  description = "The outbound IP addresses used by the Grafana dashboard for network communication."
  value       = azurerm_dashboard_grafana.dashboard_grafana.outbound_ip
}