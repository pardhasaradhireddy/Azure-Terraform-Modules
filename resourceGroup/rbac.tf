#-----------------
# Role Assignment
#-----------------
module "rbac" {
  for_each = { for k, v in var.roleAssignment : k => v }

  source = "../roleAssignment"

  scope                = azurerm_resource_group.resource_group.id
  role_definition_name = each.value.role_definition_name
  role_definition_id   = null
  principal_id         = each.value.principal_id
  description          = each.value.description
}