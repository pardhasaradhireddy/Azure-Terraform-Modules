#-------------------
# Policy Definition
#-------------------
output "id" {
  description = "The ID of the Policy Definition."
  value       = azurerm_policy_definition.policy_definition.id
}

output "role_definition_ids" {
  description = "A list of role definition id extracted from policy_rule required for remediation."
  value       = azurerm_policy_definition.policy_definition.role_definition_ids
}