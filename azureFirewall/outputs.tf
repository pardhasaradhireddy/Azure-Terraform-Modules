#----------------
# Azure Firewall Outputs
#----------------
output "id" {
  description = "The ID of the Azure Firewall instance."
  value       = azurerm_firewall.firewall.id
}

output "name" {
  description = "The name of the Azure Firewall instance."
  value       = azurerm_firewall.firewall.name
}

output "ip_configuration" {
  description = "The IP configuration details of the Azure Firewall instance."
  value       = azurerm_firewall.firewall.ip_configuration
}

output "management_ip_configuration" {
  description = "The management IP configuration details of the Azure Firewall instance."
  value       = azurerm_firewall.firewall.management_ip_configuration
}