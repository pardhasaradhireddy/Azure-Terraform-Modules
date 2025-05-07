# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product

resource "azurerm_api_management_product" "safety_product" {
  api_management_name   = var.apim_name
  resource_group_name   = var.apim_resource_group_name
  product_id            = "safety-product"
  display_name          = "Safety APIs"
  subscription_required = true
  subscriptions_limit   = 1
  approval_required     = true
  published             = false
}
