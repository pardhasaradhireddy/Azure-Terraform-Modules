output "blob_storage_container_sas" {
  value = data.azurerm_storage_account_blob_container_sas.sas_connection_string.sas
}