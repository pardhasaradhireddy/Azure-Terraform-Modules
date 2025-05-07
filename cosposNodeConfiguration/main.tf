# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_postgresql_node_configuration

resource "azurerm_cosmosdb_postgresql_node_configuration" "csgna_cospos_node_configuration" {
  cluster_id = var.cluster_id
  name       = var.node_config_name
  value      = var.node_config_value
}
