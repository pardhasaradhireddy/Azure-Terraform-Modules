#--------------------------
# Azure Firewall Nat Rules
#--------------------------
resource "azurerm_firewall_nat_rule_collection" "firewall_nat_rule_collection" {
  name                = var.firewall_nat_rule_name
  azure_firewall_name = var.azure_firewall_name
  resource_group_name = var.resource_group_name
  priority            = var.priority
  action              = var.action

  dynamic "rule" {
    for_each = var.nat_rules

    content {
      name                  = rule.value.name
      source_addresses      = rule.value.source_addresses
      destination_addresses = rule.value.destination_addresses
      destination_ports     = rule.value.destination_ports
      translated_address    = rule.value.translated_address
      translated_port       = rule.value.translated_port
      protocols             = rule.value.protocols
    }
  }

}