# Create an API Management user for the QA team load testing application
resource "azurerm_api_management_user" "load_test_user" {
  count = var.enable_prometheus_pushgateway ? 1 : 0

  resource_group_name = var.apim_resource_group_name
  api_management_name = var.apim_name
  user_id             = "dtnaloadtest-qa"
  first_name          = "Load Test"
  last_name           = "QA Team"
  email               = "dtnaloadtest.qa@daimlertruck.com"
}

# Subscribe this user to the Pushgateway API
resource "azurerm_api_management_subscription" "load_test_user_subscription" {
  count = var.enable_prometheus_pushgateway ? 1 : 0

  resource_group_name = var.apim_resource_group_name
  api_management_name = var.apim_name
  user_id             = azurerm_api_management_user.load_test_user[0].id
  product_id          = azurerm_api_management_product.pushgateway_product[0].id
  display_name        = "Pushgateway API"
  allow_tracing       = false
}