# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product

resource "azurerm_api_management_product" "ota_product" {
  api_management_name   = var.apim_name
  resource_group_name   = var.apim_resource_group_name
  product_id            = "ota-product"
  display_name          = "Over-the-Air APIs"
  subscription_required = true
  subscriptions_limit   = 1
  approval_required     = true
  published             = false
}
