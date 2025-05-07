terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      configuration_aliases = [
        azurerm.hub,
      ]
    }
  }
}

resource "azurerm_private_dns_zone_virtual_network_link" "primary" {
  name     = var.dns_vnet_name
  provider = azurerm.hub

  resource_group_name   = var.dns_rg_name
  private_dns_zone_name = var.dns_zone_name
  virtual_network_id    = var.dns_vnet_id
  registration_enabled  = var.registration_enabled
}