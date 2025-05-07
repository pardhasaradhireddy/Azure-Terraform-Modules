#-----------------
# Role Assignment
#-----------------
output "id" {
  value = azurerm_role_assignment.role_assignment.id
}

output "principal_type" {
  value = azurerm_role_assignment.role_assignment.principal_type
}