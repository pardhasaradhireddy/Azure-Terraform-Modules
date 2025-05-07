#---------------------
# Diagnostic Settings
#---------------------
variable "diagnostic_setting_name" {}

variable "resource_id" {}

variable "law_id" {}

variable "law_type" {
  default = null
}

variable "log_category_types" {}

variable "metrics" {}

variable "retention_days" {
  default = 30
}