# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_postgresql_role

resource "azurerm_cosmosdb_postgresql_role" "csgna_cospos_role" {
  cluster_id = var.cospos_cluster_id
  name       = var.role_name
  password   = var.role_password
}