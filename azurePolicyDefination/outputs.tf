#-------------------------
# Azure Policy Defination
#-------------------------
output "id" {
  value = azurerm_policy_definition.policy.id
}