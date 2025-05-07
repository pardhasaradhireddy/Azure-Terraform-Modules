#---------------------
# Application Gateway
#---------------------
variable "aks_app_gateway_name" {
  description = "The name of the Azure Application Gateway."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Application Gateway will be deployed."
  type        = string
}

variable "dns_record" {
  description = "The DNS record associated with the Application Gateway."
  type        = any
}

variable "identity" {
  description = "The managed identity configuration for the Application Gateway."
  default = {
    identity_ids = null
    type         = null
  }
}

variable "firewall_policy_id" {
  description = "(Optional) The ID of the Web Application Firewall Policy to associate with the Application Gateway."
  type        = string
  default     = null
}

variable "location" {
  description = "The Azure region where the Application Gateway will be deployed."
  type        = string
}

variable "private_ip_address" {
  description = "The private IP address to assign to the Application Gateway."
  type        = string
}

variable "private_ip_allocation" {
  description = "The allocation method for the private IP address (Static or Dynamic)."
  type        = string
}

variable "public_ip" {
  description = "The public IP configuration for the Application Gateway."
  type        = string
}

variable "sku" {
  description = "The SKU (size and tier) of the Application Gateway."
  type        = any
}

variable "subnet_id" {
  description = "The subnet ID where the Application Gateway will be deployed."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Application Gateway resource."
  type        = map(string)
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