# creates a load test resource for azure load testing
resource "azurerm_load_test" "load_test" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  description         = var.description



  identity {
    type         = var.identity.type
    identity_ids = var.identity.type == "UserAssigned" || var.identity.type == "SystemAssigned, UserAssigned" ? var.identity.identity_ids : null
  }
  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}



