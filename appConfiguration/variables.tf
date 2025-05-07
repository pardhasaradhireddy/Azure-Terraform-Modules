#-------------------
# App Configuration
#-------------------
variable "name" {
  description = "The name of the application."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create resources."
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be deployed."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(any)
  default     = {}
}

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