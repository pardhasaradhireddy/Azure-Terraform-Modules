#-------------
# Route Table
#-------------
resource "azurerm_route_table" "route_table" {
  name                          = var.route_table_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  disable_bgp_route_propagation = var.disable_bgp_route_propagation

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}

#-------
# Route
#-------
resource "azurerm_route" "route" {
  for_each               = { for route in var.routes : route.name => route }
  name                   = each.value.name
  resource_group_name    = azurerm_route_table.route_table.resource_group_name
  route_table_name       = azurerm_route_table.route_table.name
  address_prefix         = each.value.address_prefix
  next_hop_type          = each.value.next_hop_type
  next_hop_in_ip_address = each.value.next_hop_in_ip_address
}

#--------------------------------
# Route Table Subnet Association
#--------------------------------
resource "azurerm_subnet_route_table_association" "rt-snet-association" {
  for_each = var.subnet_ids

  subnet_id      = join(",", each.value)
  route_table_id = azurerm_route_table.route_table.id
}