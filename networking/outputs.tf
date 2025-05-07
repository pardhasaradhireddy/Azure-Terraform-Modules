#-----------------
# Virtual Network
#-----------------

output "vnet_id" {
  value = azurerm_virtual_network.virtual_network.id
}

output "vnet_list" {
  value = var.vnet_list
}

output "vnet_iprange" {
  value = var.vnet_list.iprange
}

output "vnet_name" {
  value = azurerm_virtual_network.virtual_network.name
}

output "network_rg_name" {
  value = azurerm_resource_group.network_resource_group.name
}

#---------
# Subnets
#---------

output "snet_map" {
  value = zipmap(azurerm_subnet.network_subnet.*.name, azurerm_subnet.network_subnet.*.id)
}