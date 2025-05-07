data "azurerm_resource_group" "k8s" {
  name = var.resource_group_name
}