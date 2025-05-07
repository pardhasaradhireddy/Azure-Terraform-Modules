#---------------
# Express Route
#---------------
resource "azurerm_express_route_circuit" "express_route_circuit" {
  name                = var.express_route_circuit_name
  resource_group_name = var.resource_group_name
  location            = var.express_route_circuit_location
  sku {
    tier   = var.express_route_sku.tier
    family = var.express_route_sku.family
  }
  service_provider_name    = try(var.service_provider_name, null)
  peering_location         = try(var.peering_location, null)
  bandwidth_in_mbps        = try(var.bandwidth_in_mbps, null)
  allow_classic_operations = try(var.allow_classic_operations, false)
  express_route_port_id    = try(var.express_route_port_id, null)
  bandwidth_in_gbps        = try(var.bandwidth_in_gbps, null)
  authorization_key        = try(var.authorization_key, null)

  tags = var.tags
  lifecycle {
    ignore_changes = all
  }
}
