resource "azurerm_key_vault_access_policy" "dcp_web_api_kv_access_policy" {
  key_vault_id = var.portal_certs_id
  tenant_id    = azurerm_app_service.dcp_web_api.identity[0].tenant_id
  object_id    = azurerm_app_service.dcp_web_api.identity[0].principal_id
  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Recover",
    "Backup",
    "Restore",
    "Purge",
  ]
}
