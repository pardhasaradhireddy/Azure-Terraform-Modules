#----------------------------
# Resource Policy Assignment
#----------------------------
output "id" {
  description = "The ID of the Resource Policy Assignment."
  value       = azurerm_resource_policy_assignment.resource_policy_assignment.id
}

output "identity" {
  description = "The Identity block of the Resource Policy Assignment."
  value       = azurerm_resource_policy_assignment.resource_policy_assignment.identity
}