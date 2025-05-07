#-------------------------
# Virtual Network Gateway
#-------------------------
resource "azurerm_virtual_network_gateway" "virtual_network_gateway" {
  name                             = var.virtual_network_gateway_name
  location                         = var.location
  resource_group_name              = var.resource_group_name
  sku                              = var.gateway_sku
  type                             = var.gateway_type
  active_active                    = try(var.active_active, false)
  default_local_network_gateway_id = try(var.default_local_network_gateway_id, null)
  edge_zone                        = try(var.edge_zone, null)
  enable_bgp                       = try(var.enable_bgp, false)

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
    private_ip_address_allocation = var.ip_configuration.private_ip_address_allocation
    subnet_id                     = var.ip_configuration.subnet_id
  }

  dynamic "bgp_settings" {
    for_each = try(var.bgp_settings, {}) != {} ? [var.bgp_settings] : []
    content {
      asn = lookup(bgp_settings.value, "asn", null)
      dynamic "peering_addresses" {
        for_each = lookup(bgp_settings.value, "peering_addresses", {}) != {} ? [bgp_settings.value.peering_addresses] : []
        content {
          ip_configuration_name = lookup(peering_addresses.value, "ip_configuration_name", null)
          apipa_addresses       = lookup(peering_addresses.value, "apipa_addresses", [])
        }
      }
      peer_weight = lookup(bgp_settings.value, "peer_weight", null)
    }
  }

  dynamic "custom_route" {
    for_each = try(var.custom_route, {}) != {} ? [var.custom_route] : []
    content {
      address_prefixes = lookup(custom_route.value, "address_prefixes", [])
    }
  }

  generation                            = try(var.generation, null)
  private_ip_address_enabled            = try(var.private_ip_address_enabled, null)
  bgp_route_translation_for_nat_enabled = try(var.bgp_route_translation_for_nat_enabled, false)
  dns_forwarding_enabled                = try(var.dns_forwarding_enabled, null)
  ip_sec_replay_protection_enabled      = try(var.ip_sec_replay_protection_enabled, true)

  dynamic "policy_group" {
    for_each = length(keys(try(var.policy_group, {}))) > 0 ? try(var.policy_group, {}) : {}
    content {
      name = policy_group.value.name
      dynamic "policy_member" {
        for_each = length(keys(lookup(policy_group.value, "policy_member", {}))) > 0 ? lookup(policy_group.value, "policy_member", {}) : {}
        content {
          name  = policy_member.value.name
          type  = policy_member.value.type
          value = policy_member.value.value
        }
      }
      is_default = lookup(policy_group.value, "is_default", false)
      priority   = lookup(policy_group.value, "priority", 0)
    }
  }

  remote_vnet_traffic_enabled = try(var.remote_vnet_traffic_enabled, false)
  virtual_wan_traffic_enabled = try(var.virtual_wan_traffic_enabled, false)

  dynamic "vpn_client_configuration" {
    for_each = try(var.vpn_client_configuration, {}) != {} ? [var.vpn_client_configuration] : []
    content {
      address_space = vpn_client_configuration.value.address_space
    }
  }

  vpn_type = try(var.vpn_type, "RouteBased")

  tags = var.tags
  lifecycle {
    ignore_changes = all
  }
}