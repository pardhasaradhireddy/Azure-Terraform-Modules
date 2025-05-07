# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_postgresql_coordinator_configuration

resource "azurerm_cosmosdb_postgresql_coordinator_configuration" "csgna_cospos_coordinator_configuration" {
  cluster_id = var.cluster_id
  name       = var.coordinator_config_name
  value      = var.coordinator_config_value
}