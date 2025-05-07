# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product

resource "azurerm_api_management_product" "api-authority-product" {
  api_management_name   = var.apim_name
  resource_group_name   = var.apim_resource_group_name
  product_id            = var.api-authority-product.product_id
  display_name          = var.api-authority-product.display_name
  subscription_required = var.api-authority-product.subscription_required
  subscriptions_limit   = var.api-authority-product.subscription_limit
  approval_required     = var.api-authority-product.approval_required
  published             = var.api-authority-product.published
}
