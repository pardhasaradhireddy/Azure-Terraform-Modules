#------------------------
# Network Security Group
#------------------------
variable "network_security_group_name" {
  description = "The name of the Network Security Group."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Network Security Group."
  type        = string
}

variable "location" {
  description = "The Azure region where the Network Security Group will be created."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Network Security Group."
  type        = map(string)
}

variable "inbound_rules" {
  description = "A list of inbound security rules to apply to the Network Security Group."
  type        = any
  default     = []
}

variable "outbound_rules" {
  description = "A list of outbound security rules to apply to the Network Security Group."
  type        = any
  default     = []
}

#------------------------
# Subnet NSG Association
#------------------------
variable "subnet_id" {
  description = "The ID of the subnet to associate with the Network Security Group."
  type        = string
}

#---------------------
# Diagnostic Settings
#---------------------
variable "enable_diagnostic_settings" {
  description = "Flag to enable or disable diagnostic settings."
  type        = bool
  default     = true
}

variable "law_id" {
  description = "The ID of the Log Analytics Workspace."
  type        = string
}

variable "log_analytics_destination_type" {
  description = "Specifies the destination type for logs in Log Analytics."
  type        = string
  default     = null
}

variable "log_category_types" {
  description = "A list of log category types to be included."
  type        = list(string)
}

variable "metrics" {
  description = "A list of metrics to be collected."
  type        = list(string)
}

variable "retention_days" {
  description = "Number of days to retain the logs."
  type        = number
  default     = 30
}