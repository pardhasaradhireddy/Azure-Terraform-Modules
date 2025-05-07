# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product

resource "azurerm_api_management_product" "prometheus_product" {
  api_management_name   = var.apim_name
  resource_group_name   = var.apim_resource_group_name
  product_id            = "prometheus-product"
  display_name          = "Prometheus APIs"
  subscription_required = true
  subscriptions_limit   = 1
  approval_required     = true
  published             = false
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product_api

resource "azurerm_api_management_product_api" "prometheus_product_api" {


  api_management_name = var.apim_name
  resource_group_name = var.apim_resource_group_name
  api_name            = "prometheus"
  product_id          = azurerm_api_management_product.prometheus_product.product_id

  depends_on = [
    azurerm_api_management_api.prometheus_api
  ]
}