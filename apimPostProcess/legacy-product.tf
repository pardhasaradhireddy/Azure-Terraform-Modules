# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product

resource "azurerm_api_management_product" "legacy_product" {
  api_management_name   = var.apim_name
  resource_group_name   = var.apim_resource_group_name
  product_id            = "legacy-product"
  display_name          = "legacy APIs"
  subscription_required = true
  subscriptions_limit   = 1
  approval_required     = true
  published             = false
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product_api

resource "azurerm_api_management_product_api" "legacy_product_api" {
  count = length(var.legacy_product_apis)

  api_management_name = var.apim_name
  resource_group_name = var.apim_resource_group_name
  api_name            = var.legacy_product_apis[count.index]
  product_id          = azurerm_api_management_product.legacy_product.product_id

  depends_on = [
    azurerm_api_management_api.legacy_api
  ]
}
