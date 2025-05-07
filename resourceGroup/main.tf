#----------------
# Resource Group
#----------------
resource "azurerm_resource_group" "resource_group" {
  name       = var.name
  location   = var.location
  managed_by = try(var.managed_by, null)

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}