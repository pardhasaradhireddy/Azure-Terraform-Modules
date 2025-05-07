#-------------------
# Storage Container
#-------------------
resource "azurerm_storage_container" "storage_container" {
  name                  = var.storage_container_name
  storage_account_name  = try(var.storage_account_name, null)
  storage_account_id    = try(var.storage_account_id, null)
  container_access_type = var.container_access_type
  metadata              = try(var.metadata, {})
}