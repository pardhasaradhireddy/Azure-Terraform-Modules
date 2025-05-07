#-----------------
# Storage Account
#-----------------
output "id" {
  description = "The resource ID of the storage account."
  value       = azurerm_storage_account.storage_account.id
}

output "name" {
  description = "The name of the storage account."
  value       = azurerm_storage_account.storage_account.name
}

output "resource_group_name" {
  description = "The name of the resource group containing the storage account."
  value       = azurerm_storage_account.storage_account.resource_group_name
}

output "primary_location" {
  description = "The primary location of the storage account."
  value       = azurerm_storage_account.storage_account.primary_location
}

output "secondary_location" {
  description = "The secondary location of the storage account, if geo-redundant storage is enabled."
  value       = azurerm_storage_account.storage_account.secondary_location
}

output "primary_blob_endpoint" {
  description = "The primary endpoint for the Blob service."
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint
}

output "primary_blob_host" {
  description = "The primary hostname for the Blob service."
  value       = azurerm_storage_account.storage_account.primary_blob_host
}

output "secondary_blob_endpoint" {
  description = "The secondary endpoint for the Blob service, if geo-redundant storage is enabled."
  value       = azurerm_storage_account.storage_account.secondary_blob_endpoint
}

output "secondary_blob_host" {
  description = "The secondary hostname for the Blob service, if geo-redundant storage is enabled."
  value       = azurerm_storage_account.storage_account.secondary_blob_host
}

output "primary_queue_endpoint" {
  description = "The primary endpoint for the Queue service."
  value       = azurerm_storage_account.storage_account.primary_queue_endpoint
}

output "secondary_queue_endpoint" {
  description = "The secondary endpoint for the Queue service, if geo-redundant storage is enabled."
  value       = azurerm_storage_account.storage_account.secondary_queue_endpoint
}

output "secondary_queue_host" {
  description = "The secondary hostname for the Queue service, if geo-redundant storage is enabled."
  value       = azurerm_storage_account.storage_account.secondary_queue_host
}

output "primary_table_endpoint" {
  description = "The primary endpoint for the Table service."
  value       = azurerm_storage_account.storage_account.primary_table_endpoint
}

output "primary_table_host" {
  description = "The primary hostname for the Table service."
  value       = azurerm_storage_account.storage_account.primary_table_host
}

output "secondary_table_endpoint" {
  description = "The secondary endpoint for the Table service, if geo-redundant storage is enabled."
  value       = azurerm_storage_account.storage_account.secondary_table_endpoint
}

output "secondary_table_host" {
  description = "The secondary hostname for the Table service, if geo-redundant storage is enabled."
  value       = azurerm_storage_account.storage_account.secondary_table_host
}

output "primary_file_endpoint" {
  description = "The primary endpoint for the File service."
  value       = azurerm_storage_account.storage_account.primary_file_endpoint
}

output "primary_file_host" {
  description = "The primary hostname for the File service."
  value       = azurerm_storage_account.storage_account.primary_file_host
}

output "secondary_file_endpoint" {
  description = "The secondary endpoint for the File service, if geo-redundant storage is enabled."
  value       = azurerm_storage_account.storage_account.secondary_file_endpoint
}

output "secondary_file_host" {
  description = "The secondary hostname for the File service, if geo-redundant storage is enabled."
  value       = azurerm_storage_account.storage_account.secondary_file_host
}

output "primary_dfs_endpoint" {
  description = "The primary endpoint for the Data Lake (DFS) service."
  value       = azurerm_storage_account.storage_account.primary_dfs_endpoint
}

output "primary_dfs_host" {
  description = "The primary hostname for the Data Lake (DFS) service."
  value       = azurerm_storage_account.storage_account.primary_dfs_host
}

output "secondary_dfs_endpoint" {
  description = "The secondary endpoint for the Data Lake (DFS) service, if geo-redundant storage is enabled."
  value       = azurerm_storage_account.storage_account.secondary_dfs_endpoint
}

output "secondary_dfs_host" {
  description = "The secondary hostname for the Data Lake (DFS) service, if geo-redundant storage is enabled."
  value       = azurerm_storage_account.storage_account.secondary_dfs_host
}

output "primary_web_endpoint" {
  description = "The primary endpoint for the Web service."
  value       = azurerm_storage_account.storage_account.primary_web_endpoint
}

output "primary_web_host" {
  description = "The primary hostname for the Web service."
  value       = azurerm_storage_account.storage_account.primary_web_host
}

output "secondary_web_endpoint" {
  description = "The secondary endpoint for the Web service, if geo-redundant storage is enabled."
  value       = azurerm_storage_account.storage_account.secondary_web_endpoint
}

output "secondary_web_host" {
  description = "The secondary hostname for the Web service, if geo-redundant storage is enabled."
  value       = azurerm_storage_account.storage_account.secondary_web_host
}

output "primary_access_key" {
  description = "The primary access key for the storage account."
  value       = azurerm_storage_account.storage_account.primary_access_key
}

output "secondary_access_key" {
  description = "The secondary access key for the storage account, if geo-redundant storage is enabled."
  value       = azurerm_storage_account.storage_account.secondary_access_key
}

output "primary_connection_string" {
  description = "The primary connection string for the storage account."
  value       = azurerm_storage_account.storage_account.primary_connection_string
}

output "secondary_connection_string" {
  description = "The secondary connection string for the storage account, if geo-redundant storage is enabled."
  value       = azurerm_storage_account.storage_account.secondary_connection_string
}

output "primary_blob_connection_string" {
  description = "The primary connection string for the Blob service."
  value       = azurerm_storage_account.storage_account.primary_blob_connection_string
}

output "secondary_blob_connection_string" {
  description = "The secondary connection string for the Blob service, if geo-redundant storage is enabled."
  value       = azurerm_storage_account.storage_account.secondary_blob_connection_string
}

output "identity" {
  description = "The identity block of the storage account."
  value       = azurerm_storage_account.storage_account.identity
}