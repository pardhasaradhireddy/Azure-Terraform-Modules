#-------------------
# Policy Definition
#-------------------
resource "azurerm_policy_definition" "policy_definition" {
  name                = var.policy_definition_name
  policy_type         = var.policy_type
  mode                = var.mode
  display_name        = var.display_name
  description         = try(var.description, null)
  management_group_id = try(var.management_group_id, null)
  policy_rule         = try(var.policy_rule, null)
  metadata            = try(var.metadata, null)
  parameters          = try(var.parameters, null)
}