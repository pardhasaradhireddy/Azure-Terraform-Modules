#-----------
# Public IP
#-----------
variable "public_ip_name" {
  description = "The name of the public IP address resource."
  default     = null
}

variable "location" {
  description = "The Azure region where the public IP will be created."
  default     = null
}

variable "resource_group_name" {
  description = "The name of the resource group in which the public IP will be created."
  default     = null
}

variable "allocation_method" {
  description = "The allocation method for the public IP address (Static or Dynamic)."
  default     = "Static"
}

variable "sku" {
  description = "The SKU of the public IP address (Basic or Standard)."
  default     = "Standard"
}

variable "sku_tier" {
  description = "The tier of the SKU for the public IP address (e.g., Regional or Global)."
  default     = "Regional"
}

variable "domain_name_label" {
  description = "The domain name label to use for the public IP address. Defaults to null."
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the public IP address."
  default     = {}
}

#---------------------
# Diagnostic Settings
#---------------------
variable "enable_diagnostic_settings" {
  description = "A flag to enable or disable diagnostic settings for the public IP address."
  default     = true
}

variable "law_id" {
  description = "The resource ID of the Log Analytics Workspace to associate with the diagnostic settings."
  default     = null
}

variable "log_analytics_destination_type" {
  description = "Specifies the destination type for logs in the Log Analytics Workspace. Defaults to null."
  default     = null
}

variable "log_category_types" {
  description = "The list of log categories to capture for the public IP address diagnostic settings."
  default     = []
}

variable "metrics" {
  description = "A list of metrics to capture for the public IP address diagnostic settings."
  default     = []
}

variable "retention_days" {
  description = "The number of days to retain logs and metrics in the diagnostic settings. Defaults to 30."
  default     = 30
}