# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_product

resource "azurerm_api_management_product" "fuso_product" {
  api_management_name   = var.apim_name
  resource_group_name   = var.apim_resource_group_name
  product_id            = "fuso-product"
  display_name          = "Fuso Onboarding API"
  subscription_required = true
  subscriptions_limit   = 1
  approval_required     = true
  published             = true
}

resource "azurerm_api_management_product_policy" "fuso_ratelimit_policy" {
  product_id          = azurerm_api_management_product.fuso_product.product_id
  api_management_name = var.apim_name
  resource_group_name = var.apim_resource_group_name
  xml_content         = file("${path.module}/fuso-product-policy.xml")
}
