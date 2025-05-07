# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product

resource "azurerm_api_management_product" "dcp_product" {
  api_management_name   = var.apim_name
  resource_group_name   = var.apim_resource_group_name
  product_id            = var.dcp_product.product_id
  display_name          = var.dcp_product.display_name
  subscription_required = var.dcp_product.subscription_required
  subscriptions_limit   = var.dcp_product.subscription_limit
  approval_required     = var.dcp_product.approval_required
  published             = var.dcp_product.published
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product_api

resource "azurerm_api_management_product_api" "dcp_product_api" {
  count = length(var.dcp_product_apis)

  api_management_name = var.apim_name
  resource_group_name = var.apim_resource_group_name
  api_name            = var.dcp_product_apis[count.index]
  product_id          = azurerm_api_management_product.dcp_product.product_id

  depends_on = [
    azurerm_api_management_api.demo_api,
    azurerm_api_management_api.legacy_api
  ]
}

