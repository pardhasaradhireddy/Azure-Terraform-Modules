#-----------------
# Public DNS zone
#-----------------

output "public_dns_zone" {
  description = "The Name of the Public DNS Zone."
  value       = azurerm_dns_zone.public_dns_zone
}

output "public_dns_zone_id" {
  description = "The ID of the Public DNS Zone."
  value       = azurerm_dns_zone.public_dns_zone.id
}