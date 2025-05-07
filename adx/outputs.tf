output "adx_uri" {
  value = azurerm_kusto_cluster.adx_cluster.uri
}

output "adx_ingestion_uri" {
  value = azurerm_kusto_cluster.adx_cluster.data_ingestion_uri
}

output "adx_identity" {
  value = azurerm_kusto_cluster.adx_cluster.identity
}

output "rsg_name" {
  value = azurerm_resource_group.adx_resource_group.name
}