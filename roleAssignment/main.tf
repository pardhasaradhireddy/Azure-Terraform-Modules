#-----------------
# Role Assignment
#-----------------
resource "azurerm_role_assignment" "role_assignment" {
  description          = var.description
  role_definition_name = var.role_definition_name
  role_definition_id   = var.role_definition_id
  principal_id         = var.principal_id
  scope                = var.scope
}