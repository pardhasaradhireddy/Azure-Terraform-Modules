# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_postgresql_firewall_rule

resource "azurerm_cosmosdb_postgresql_firewall_rule" "csgna_cospos_firewall_rule" {
  cluster_id       = var.cluster_id
  name             = var.rule_name
  start_ip_address = var.start_ip_address
  end_ip_address   = var.end_ip_address
}