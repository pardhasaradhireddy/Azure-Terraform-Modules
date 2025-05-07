#---------------
# User Identity Federated Credential
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/federated_identity_credential
#---------------
resource "azurerm_federated_identity_credential" "user_identity_fc" {
  name                = var.name
  resource_group_name = var.resource_group_name
  audience            = var.audience
  issuer              = var.issuer
  parent_id           = var.identity_id
  subject             = var.subject
}