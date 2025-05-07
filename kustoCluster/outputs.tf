output "cluster_name" {
  value = azurerm_kusto_cluster.kusto_cluster.name
}

output "clsuter_id" {
  value = azurerm_kusto_cluster.kusto_cluster.id
}

output "uri" {
  value = azurerm_kusto_cluster.kusto_cluster.uri
}

output "identity" {
  value = azurerm_kusto_cluster.kusto_cluster.identity[0].principal_id
}