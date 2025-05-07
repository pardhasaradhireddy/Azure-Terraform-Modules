variable "resource_group_name" {}

variable "location" {}

variable "adx_name" {}

variable "adx_sku" {}

variable "adx_count" {}

variable "adx_diagnostics_name" {
  default = "log-adx"
}

variable "log_analytics_workspace_id" {}

variable "adx_databases" {
  description = "List of ADX databases to create"
  type        = list(string)
  default     = []
}

/* variable "eventhub_ns_name" {}

variable "eventhub_ns_sku" {}

variable "eventhub_name" {}

variable "partition_count" {}

variable "message_retention" {}

variable "consumer_group" {}

variable "data_connection" {} */

variable "tags" {}