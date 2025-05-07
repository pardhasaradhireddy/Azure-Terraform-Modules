# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product

resource "azurerm_api_management_product" "platformtest_product" {
  api_management_name   = var.apim_name
  resource_group_name   = var.apim_resource_group_name
  product_id            = "platformtest-product"
  display_name          = "platformtest APIs"
  subscription_required = true
  subscriptions_limit   = 1
  approval_required     = true
  published             = false
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product_api

resource "azurerm_api_management_product_api" "platformtest_product_api" {


  api_management_name = var.apim_name
  resource_group_name = var.apim_resource_group_name
  api_name            = "platformtest"
  product_id          = azurerm_api_management_product.platformtest_product.product_id

  depends_on = [
    azurerm_api_management_api.platformtest_api
  ]
}
