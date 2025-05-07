#--------------------------------
# Subscription Policy Assignment
#--------------------------------
output "id" {
  description = "The ID of the Subscription Policy Assignment."
  value       = azurerm_subscription_policy_assignment.subscription_policy_assignment.id
}

output "identity" {
  description = "The Identity block of the Subscription Policy Assignment."
  value       = azurerm_subscription_policy_assignment.subscription_policy_assignment.identity
}