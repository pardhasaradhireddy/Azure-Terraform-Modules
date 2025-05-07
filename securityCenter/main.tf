/* resource "azurerm_security_center_workspace" "telematics_security_center" {
  scope        = "/subscriptions/${var.subscription_id
  workspace_id = var.workspace_id
} */

resource "azurerm_security_center_subscription_pricing" "sc_price_tier" {
  tier = "Standard"
}

resource "azurerm_security_center_contact" "example" {
  email = "dw_164-seal-ocs_telematics-infra@daimler.com"
  phone = "+1-555-555-5555"

  alert_notifications = true
  alerts_to_admins    = false
}