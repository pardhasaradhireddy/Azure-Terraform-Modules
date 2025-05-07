variable "name" {}
variable "location" {}
variable "resource_group_name" {}

variable "sku" {}

variable "engine" {
  default = "V2"
}
variable "allowed_fqdns" {
  default = []
}
variable "allowed_ip_ranges" {
  default = []
}
variable "double_encryption_enabled" {
  default = false
}

variable "identity" {
  default = {
    identity_ids = []
    type         = "SystemAssigned"
  }
}

variable "auto_stop_enabled" {
  default = true
}
variable "optimized_auto_scale" {
  default = {
    minimum_instances = 2
    maximum_instances = 2
  }
}
variable "zones" {
  default = ["1", "2", "3"]
}

variable "disk_encryption_enabled" {
  default = false
}
variable "streaming_ingestion_enabled" {
  default = false
}
variable "public_ip_type" {
  default = "IPv4"
}
variable "public_network_access_enabled" {
  default = true
}
variable "outbound_network_access_restricted" {
  default = false
}
variable "purge_enabled" {
  default = false
}
variable "virtual_network_configuration" {
  default = {}
}
variable "language_extensions" {
  default = []
}
variable "trusted_external_tenants" {
  default = ["*"]
}

variable "tags" {}

variable "diagnostics_name" {}

variable "log_analytics_workspace_id" {}