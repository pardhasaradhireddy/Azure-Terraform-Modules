#--------------
# Bastion Host
#--------------
variable "bastion_host_name" {}

variable "location" {}

variable "resource_group_name" {}

variable "sku" {}

variable "tunneling_enabled" {}

variable "ip_configuration_name" {}

variable "subnet_id" {}

variable "public_ip_address_id" {}

variable "tags" {}

#---------------------
# Diagnostic Settings
#---------------------
variable "enable_diagnostic_settings" {
  default = true
}

variable "law_id" {}

variable "log_analytics_destination_type" {
  default = null
}

variable "log_category_types" {}

variable "metrics" {}

variable "retention_days" {
  default = 30
}
