# Resource Group
variable "resource_group_name" {}
variable "location" {}

# Cluster Details
variable "cluster_name" {}

# Cluster Admin Credentials
variable "cospos_admin_login_password" {}

# Read Replica Properties
variable "source_resource_id" {}
variable "source_location" {}

# Versions & Tags
variable "citus_version" {
  default = "12.1"
}
variable "sql_version" {
  default = "16"
}
variable "tags" {}

# Co-ordinator Properties
variable "coordinator_storage_quota_in_mb" {}
variable "coordinator_vcore_count" {}
variable "coordinator_public_ip_access_enabled" {
  default = false
}
variable "shards_on_coordinator_enabled" {
  default = false
}

# Node Properties
variable "node_count" {}
variable "node_vcores" {}
variable "node_storage_quota_in_mb" {}
variable "node_server_edition" {}
variable "node_public_ip_access_enabled" {
  default = false
}

# High Availability
variable "ha_enabled" {
  default = false
}

# Primary Availability Zone
# variable "preferred_primary_zone" {}

# Restore Cluster Time
# variable "point_in_time_in_utc" {}
