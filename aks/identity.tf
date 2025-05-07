#---------------
# User Identity
#---------------
resource "azurerm_user_assigned_identity" "identity" {
  name                = "mi-${var.aks_cluster_name}"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}