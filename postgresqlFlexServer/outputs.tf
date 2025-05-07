#----------------------------
# PostgreSQL Flexible Server
#----------------------------
output "id" {
  description = "The resource ID of the PostgreSQL Flexible Server instance."
  value       = azurerm_postgresql_flexible_server.psqlflexibleserver.id
}

output "fqdn" {
  description = "The fully qualified domain name (FQDN) of the PostgreSQL Flexible Server instance."
  value       = azurerm_postgresql_flexible_server.psqlflexibleserver.fqdn
}

output "public_network_access_enabled" {
  description = "Indicates whether public network access is enabled for the PostgreSQL Flexible Server instance."
  value       = azurerm_postgresql_flexible_server.psqlflexibleserver.public_network_access_enabled
}