#-----------------------------------------
# Express Route & VNET Gateway Connection
#-----------------------------------------
resource "azurerm_virtual_network_gateway_connection" "expressroute_vng_connection" {
  name                       = var.expressroute_vng_connection_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  type                       = var.gateway_type
  virtual_network_gateway_id = azurerm_virtual_network_gateway.virtual_network_gateway.id
  express_route_circuit_id   = azurerm_express_route_circuit.express_route_circuit.id
  tags                       = var.tags
  lifecycle {
    ignore_changes = all
  }
}