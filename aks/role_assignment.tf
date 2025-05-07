#------------------
# Role Assignments
#------------------
resource "azurerm_role_assignment" "rt_access" {
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
  scope                = var.routetable_id
}

resource "azurerm_role_assignment" "nsg_access" {
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
  scope                = var.network_security_group_id
}

resource "azurerm_role_assignment" "nsg_access_nodepool" {
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
  scope                = var.network_security_group_id_nodepool
}

resource "azurerm_role_assignment" "subnet_access" {
  count = var.ingress_application_gateway == {} ? 0 : 1

  role_definition_name = "Network Contributor"
  principal_id         = azurerm_kubernetes_cluster.k8s.ingress_application_gateway[0].ingress_application_gateway_identity[0].object_id
  scope                = var.ingress_application_gateway.subnet_id
}

resource "azurerm_role_assignment" "subnet_access_identity" {
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
  scope                = var.subnet_id
}

resource "azurerm_role_assignment" "subnet_access_identity_nodepool" {
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
  scope                = var.nodepool_subnet_id
}

resource "azurerm_role_assignment" "mi_to_aks_rg" {
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
  scope                = data.azurerm_resource_group.k8s.id
}