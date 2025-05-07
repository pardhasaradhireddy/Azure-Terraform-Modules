#----------------
# Resource Group
#----------------

resource "azurerm_resource_group" "network_resource_group" {
  name     = var.network_rg_name
  location = var.location

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

#-----------------
# Virtual Network
#-----------------

resource "azurerm_virtual_network" "virtual_network" {
  depends_on          = [azurerm_resource_group.network_resource_group]
  name                = var.vnet_list.name
  resource_group_name = azurerm_resource_group.network_resource_group.name
  location            = azurerm_resource_group.network_resource_group.location
  address_space       = var.vnet_list.iprange
  dns_servers         = ["53.29.237.56", "168.63.129.16", "53.29.237.55"]

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

#---------
# Subnets
#---------

locals {
  snet_keys = keys(var.vnet_list.snets)
}

resource "azurerm_subnet" "network_subnet" {
  depends_on           = [azurerm_virtual_network.virtual_network]
  count                = length(local.snet_keys)
  name                 = local.snet_keys[count.index]
  resource_group_name  = azurerm_resource_group.network_resource_group.name
  address_prefixes     = [var.vnet_list.snets[local.snet_keys[count.index]]]
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  service_endpoints    = var.service_endpoints

  dynamic "delegation" {
    for_each = local.snet_keys[count.index] == var.delegation_subnet ? [1] : []
    content {
      name = var.delegation_name
      service_delegation {
        name    = var.delegation_service
        actions = ["Microsoft.Network/virtualNetworks/subnets/action", ]
      }
    }
  }

}

#-------------
# Diagnostics
#-------------

resource "azurerm_monitor_diagnostic_setting" "vnet_diagnostics" {
  depends_on                 = [azurerm_virtual_network.virtual_network]
  name                       = var.vnet_diagnostics_name
  target_resource_id         = azurerm_virtual_network.virtual_network.id
  log_analytics_workspace_id = var.log_analytics_workspace_uri

  log {
    category = "VMProtectionAlerts"

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      days    = 0
      enabled = false
    }
  }
}
