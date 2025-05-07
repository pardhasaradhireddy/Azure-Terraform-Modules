# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product

resource "azurerm_api_management_product" "platsci_product" {
  api_management_name   = var.apim_name
  resource_group_name   = var.apim_resource_group_name
  product_id            = var.platsci_product.product_id
  display_name          = var.platsci_product.display_name
  subscription_required = var.platsci_product.subscription_required
  subscriptions_limit   = var.platsci_product.subscriptions_limit
  approval_required     = var.platsci_product.approval_required
  published             = var.platsci_product.published
}
