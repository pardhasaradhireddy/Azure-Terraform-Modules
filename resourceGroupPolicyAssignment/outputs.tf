#----------------------------------
# Resource Group Policy Assignment
#----------------------------------
output "id" {
  description = "The ID of the Resource Group Policy Assignment."
  value       = azurerm_resource_group_policy_assignment.resource_group_policy_assignment.id
}

output "identity" {
  description = "The Identity block of the Resource Group Policy Assignment."
  value       = azurerm_resource_group_policy_assignment.resource_group_policy_assignment.identity
}