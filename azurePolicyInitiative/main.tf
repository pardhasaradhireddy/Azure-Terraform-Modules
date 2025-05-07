resource "azurerm_policy_set_definition" "example" {
  name         = var.name
  policy_type  = var.policy_type
  display_name = var.display_name
  policy_definition_reference {
    policy_definition_id = var.policy_definition_ids
    parameter_values     = var.parameter_values
  }
}