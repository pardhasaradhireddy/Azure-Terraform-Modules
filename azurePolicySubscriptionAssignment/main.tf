resource "azurerm_subscription_policy_assignment" "example" {
  name                 = var.name
  policy_definition_id = var.policy_definition_id
  subscription_id      = var.subscription_id
  description          = var.description
  display_name         = var.display_name
  non_compliance_message {
    content = var.non_compliance_message
  }
  not_scopes = var.not_scopes
  parameters = var.parameters
}