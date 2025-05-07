# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set

resource "azurerm_api_management_api_version_set" "demo_api_version_set" {
  name                = var.demo_api_version_set.name
  resource_group_name = var.apim_resource_group_name
  api_management_name = var.apim_name
  display_name        = var.demo_api_version_set.display_name
  versioning_scheme   = var.demo_api_version_set.versioning_scheme
}
