# Create an API Management user for the Fuso CTP Manager application
resource "azurerm_api_management_user" "fuso_api_user" {

  resource_group_name = var.apim_resource_group_name
  api_management_name = var.apim_name
  user_id             = "fusoonboarding-user"
  first_name          = "Fuso"
  last_name           = "CTP Manager"
  email               = "truckonnect@daimlertruck.com"
}

# Subscribe this user to the Fuso onboarding API
resource "azurerm_api_management_subscription" "fuso_api_user_subscription" {

  resource_group_name = var.apim_resource_group_name
  api_management_name = var.apim_name
  user_id             = azurerm_api_management_user.fuso_api_user.id
  product_id          = azurerm_api_management_product.fuso_product.id
  display_name        = "Fuso Onboarding API"
  state               = "active"

  lifecycle {
    ignore_changes = [
      allow_tracing
    ]
  }
}
