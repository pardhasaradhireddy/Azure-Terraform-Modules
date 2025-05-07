#--------------------
# EventHub Namespace
#--------------------
output "name" {
  description = "The EventHub Namespace Name."
  value       = azurerm_eventhub_namespace.eventhub_ns.name
}

output "id" {
  description = "The EventHub Namespace ID."
  value       = azurerm_eventhub_namespace.eventhub_ns.id
}

output "identity" {
  description = "An identity block"
  value       = azurerm_eventhub_namespace.eventhub_ns.identity
}

output "default_primary_connection_string" {
  description = "The primary connection string for the authorization rule RootManageSharedAccessKey."
  value       = azurerm_eventhub_namespace.eventhub_ns.default_primary_connection_string
}

output "default_primary_connection_string_alias" {
  description = "The alias of the primary connection string for the authorization rule RootManageSharedAccessKey, which is generated when disaster recovery is enabled."
  value       = azurerm_eventhub_namespace.eventhub_ns.default_primary_connection_string_alias
}

output "default_primary_key" {
  description = "The primary access key for the authorization rule RootManageSharedAccessKey."
  value       = azurerm_eventhub_namespace.eventhub_ns.default_primary_key
}

output "default_secondary_connection_string" {
  description = "The secondary connection string for the authorization rule RootManageSharedAccessKey."
  value       = azurerm_eventhub_namespace.eventhub_ns.default_secondary_connection_string
}

output "default_secondary_connection_string_alias" {
  description = "The alias of the secondary connection string for the authorization rule RootManageSharedAccessKey, which is generated when disaster recovery is enabled."
  value       = azurerm_eventhub_namespace.eventhub_ns.default_secondary_connection_string_alias
}

output "default_secondary_key" {
  description = "The secondary access key for the authorization rule RootManageSharedAccessKey."
  value       = azurerm_eventhub_namespace.eventhub_ns.default_secondary_key
}