#-----------
# Public IP
#-----------
output "id" {
  description = "The resource ID of the Azure public IP address."
  value       = azurerm_public_ip.public_ip.id
}

output "ip_address" {
  description = "The actual public IP address allocated by Azure."
  value       = azurerm_public_ip.public_ip.ip_address
}

output "name" {
  description = "The name of the Azure public IP address resource."
  value       = azurerm_public_ip.public_ip.name
}