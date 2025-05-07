# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product

resource "azurerm_api_management_product" "truckconnect_product" {
  api_management_name   = var.apim_name
  resource_group_name   = var.apim_resource_group_name
  product_id            = var.truckconnect_product.product_id
  display_name          = var.truckconnect_product.display_name
  subscription_required = var.truckconnect_product.subscription_required
  subscriptions_limit   = var.truckconnect_product.subscription_limit
  approval_required     = var.truckconnect_product.approval_required
  published             = var.truckconnect_product.published
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product_api

resource "azurerm_api_management_product_api" "truckconnect_product_api" {
  count = length(var.truckconnect_product_apis)

  api_management_name = var.apim_name
  resource_group_name = var.apim_resource_group_name
  api_name            = var.truckconnect_product_apis[count.index]
  product_id          = azurerm_api_management_product.truckconnect_product.product_id

  depends_on = [
    azurerm_api_management_api.eb_truckconnect_api
  ]
}