terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      configuration_aliases = [
        azurerm.hub,
        azurerm.spoke,
      ]
    }
  }
}

resource "azurerm_virtual_network_peering" "peer1" {
  provider = azurerm.hub

  name                         = var.hub_to_spoke
  resource_group_name          = var.hub_rg_name
  virtual_network_name         = var.hub_vnet_name
  remote_virtual_network_id    = var.spoke_vnet_id
  allow_virtual_network_access = try(var.peer1_allow_virtual_network_access, true)
  allow_forwarded_traffic      = try(var.peer1_allow_forwarded_traffic, false)
  allow_gateway_transit        = try(var.peer1_allow_gateway_transit, false)
  use_remote_gateways          = try(var.peer1_use_remote_gateways, false)
}

resource "azurerm_virtual_network_peering" "peer2" {
  provider = azurerm.spoke

  name                         = var.spoke_to_hub
  resource_group_name          = var.spoke_rg_name
  virtual_network_name         = var.spoke_vnet_name
  remote_virtual_network_id    = var.hub_vnet_id
  allow_virtual_network_access = try(var.peer2_allow_virtual_network_access, true)
  allow_forwarded_traffic      = try(var.peer2_allow_forwarded_traffic, false)
  allow_gateway_transit        = try(var.peer2_allow_gateway_transit, false)
  use_remote_gateways          = try(var.peer2_use_remote_gateways, false)
}