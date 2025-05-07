resource "azurerm_policy_definition" "policy" {
  name         = var.name
  display_name = tostring(local.policy_data.properties.displayName)
  description  = tostring(local.policy_data.properties.description)
  policy_type  = tostring(local.policy_data.properties.policyType)
  mode         = tostring(local.policy_data.properties.mode)
  metadata     = jsonencode(local.policy_data.properties.metadata)
  parameters   = jsonencode(local.policy_data.properties.parameters)
  policy_rule  = jsonencode(local.policy_data.properties.policyRule)
}

