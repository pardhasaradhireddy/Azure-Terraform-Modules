# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product

resource "azurerm_api_management_product" "pushgateway_product" {
  count                 = var.enable_prometheus_pushgateway ? 1 : 0
  api_management_name   = var.apim_name
  resource_group_name   = var.apim_resource_group_name
  product_id            = "pushgateway-product"
  display_name          = "Prometheus Pushgateway APIs"
  subscription_required = true
  subscriptions_limit   = 1
  approval_required     = true
  published             = true
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product_api

resource "azurerm_api_management_product_api" "pushgateway_product_api" {
  count               = var.enable_prometheus_pushgateway ? 1 : 0
  api_management_name = var.apim_name
  resource_group_name = var.apim_resource_group_name
  api_name            = "pushgateway"
  product_id          = azurerm_api_management_product.pushgateway_product[0].product_id

  depends_on = [
    azurerm_api_management_api.pushgateway_api
  ]
}
