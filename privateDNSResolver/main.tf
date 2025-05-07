#----------------------
# Private DNS Resolver
#----------------------
resource "azurerm_private_dns_resolver" "private_dns_resolver" {
  name                = var.private_dns_resolver_name
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_network_id  = var.virtual_network_id

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}

#-------------------
# Outbound Endpoint
#-------------------
resource "azurerm_private_dns_resolver_outbound_endpoint" "outbound_endpoint" {
  name                    = var.outbound_endpoint_name
  private_dns_resolver_id = azurerm_private_dns_resolver.private_dns_resolver.id
  location                = azurerm_private_dns_resolver.private_dns_resolver.location
  subnet_id               = var.subnet_id

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}

#--------------------
# Forwarding Ruleset
#--------------------
resource "azurerm_private_dns_resolver_dns_forwarding_ruleset" "forwarding_ruleset" {
  name                                       = var.forwarding_ruleset_name
  resource_group_name                        = azurerm_private_dns_resolver.private_dns_resolver.resource_group_name
  location                                   = azurerm_private_dns_resolver.private_dns_resolver.location
  private_dns_resolver_outbound_endpoint_ids = [azurerm_private_dns_resolver_outbound_endpoint.outbound_endpoint.id]

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}

#------------------
# Forwarding Rules
#------------------
resource "azurerm_private_dns_resolver_forwarding_rule" "forwarding_rule" {
  for_each                  = var.forwarding_rules
  name                      = each.key
  dns_forwarding_ruleset_id = azurerm_private_dns_resolver_dns_forwarding_ruleset.forwarding_ruleset.id
  domain_name               = each.value.domain_name
  enabled                   = each.value.enabled

  dynamic "target_dns_servers" {
    for_each = each.value.target_dns_servers
    content {
      ip_address = target_dns_servers.value.ip_address
      port       = target_dns_servers.value.port
    }
  }

  metadata = {
    key = "value"
  }
}

#----------------------
# Virtual Network Link
#----------------------
resource "azurerm_private_dns_resolver_virtual_network_link" "virtual_network_link" {
  name                      = var.virtual_network_link_name
  dns_forwarding_ruleset_id = azurerm_private_dns_resolver_dns_forwarding_ruleset.forwarding_ruleset.id
  virtual_network_id        = var.virtual_network_id
  metadata = {
    key = "value"
  }
}