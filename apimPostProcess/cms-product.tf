# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product

resource "azurerm_api_management_product" "cms_product" {
  api_management_name   = var.apim_name
  resource_group_name   = var.apim_resource_group_name
  product_id            = var.cms_product.product_id
  display_name          = var.cms_product.display_name
  subscription_required = var.cms_product.subscription_required
  subscriptions_limit   = var.cms_product.subscription_limit
  approval_required     = var.cms_product.approval_required
  published             = var.cms_product.published
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product_api

resource "azurerm_api_management_product_api" "cms_product_api" {
  count = length(var.cms_product_apis)

  api_management_name = var.apim_name
  resource_group_name = var.apim_resource_group_name
  api_name            = var.cms_product_apis[count.index]
  product_id          = azurerm_api_management_product.cms_product.product_id

  depends_on = [
    azurerm_api_management_api.legacy_api
  ]
}
