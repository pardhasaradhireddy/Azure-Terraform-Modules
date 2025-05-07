# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product

resource "azurerm_api_management_product" "geotab_product" {
  api_management_name   = var.apim_name
  resource_group_name   = var.apim_resource_group_name
  product_id            = var.geotab_product.product_id
  display_name          = var.geotab_product.display_name
  subscription_required = var.geotab_product.subscription_required
  subscriptions_limit   = var.geotab_product.subscriptions_limit
  approval_required     = var.geotab_product.approval_required
  published             = var.geotab_product.published
}