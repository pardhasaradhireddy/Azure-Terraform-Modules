#-----------------
# Virtual Network
#-----------------
variable "virtual_network_name" {}

variable "location" {}

variable "resource_group_name" {}

variable "address_space" {}

variable "ddos_protection_plan" {
  default = {}
}

variable "tags" {}

#---------
# Subnets
#---------
variable "subnets" {}

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