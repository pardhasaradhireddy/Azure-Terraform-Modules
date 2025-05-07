#-------------------------
# Azure Monitor Workspace
#-------------------------
resource "azurerm_monitor_workspace" "monitor_workspace" {
  name                          = var.monitor_workspace_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  public_network_access_enabled = try(var.public_network_access_enabled, true)

  tags = var.tags
  lifecycle {
    ignore_changes = all
  }
}