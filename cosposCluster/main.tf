# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_postgresql_cluster

resource "azurerm_cosmosdb_postgresql_cluster" "csgna_cospos_cluster" {

  # (required) name of postgresql cluster
  name = var.cluster_name

  # (required) resource group
  resource_group_name = var.resource_group_name
  location            = var.location

  # (required, if source_resource_id is not set) database admin password
  administrator_login_password = var.cospos_admin_login_password

  # (optional) read replica
  source_resource_id = var.source_resource_id
  source_location    = var.source_location

  # (optional) sql/citus versions and tags
  sql_version   = var.sql_version
  citus_version = var.citus_version
  tags          = var.tags

  # (optional) co-ordinator properties
  coordinator_vcore_count              = var.coordinator_vcore_count
  coordinator_storage_quota_in_mb      = var.coordinator_storage_quota_in_mb
  coordinator_public_ip_access_enabled = var.coordinator_public_ip_access_enabled
  shards_on_coordinator_enabled        = var.shards_on_coordinator_enabled

  # (required) worker node count, possible values: 0 to 20 except 1
  node_count = var.node_count

  # (optional) node properties
  node_vcores                   = var.node_vcores
  node_storage_quota_in_mb      = var.node_storage_quota_in_mb
  node_server_edition           = var.node_server_edition
  node_public_ip_access_enabled = var.node_public_ip_access_enabled

  # (Optional) high availability. defaults to false.
  ha_enabled = var.ha_enabled

  # (Optional) preferred primary availability zone
  # preferred_primary_zone = var.preferred_primary_zone

  # (Optional) The date and time for the cluster restore
  # UTC (ISO8601 format) eg. "2024-08-08 08:00:00 +0000 UTC"
  # point_in_time_in_utc = var.point_in_time_in_utc


  # (Optional) server maintenance window
  maintenance_window {
    day_of_week  = 0
    start_hour   = 5 # 5 UTC = 21:00hrs (9PM PST)
    start_minute = 0
  }

  lifecycle {
    ignore_changes = [
      tags["created_date"]
    ]
  }


}