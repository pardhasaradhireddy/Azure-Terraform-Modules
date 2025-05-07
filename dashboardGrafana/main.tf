#-------------------
# Dashboard Grafana
#-------------------
resource "azurerm_dashboard_grafana" "dashboard_grafana" {
  name                                   = var.dashboard_grafana_name
  resource_group_name                    = var.resource_group_name
  location                               = var.location
  api_key_enabled                        = try(var.api_key_enabled, false)
  auto_generated_domain_name_label_scope = try(var.auto_generated_domain_name_label_scope, "TenantReuse")
  deterministic_outbound_ip_enabled      = try(var.deterministic_outbound_ip_enabled, false)
  grafana_major_version                  = var.grafana_major_version

  dynamic "azure_monitor_workspace_integrations" {
    for_each = try(var.azure_monitor_workspace_integrations, null) != null ? var.azure_monitor_workspace_integrations : []
    content {
      resource_id = azure_monitor_workspace_integrations.value
    }
  }

  identity {
    type = "SystemAssigned"
  }

  public_network_access_enabled = try(var.public_network_access_enabled, true)
  sku                           = try(var.sku, "Standard")
  zone_redundancy_enabled       = try(var.zone_redundancy_enabled, false)

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}