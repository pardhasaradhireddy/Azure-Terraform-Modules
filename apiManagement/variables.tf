#----------------
# API Management
#----------------
variable "api_management_name" {
  description = "The name of the API Management service."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the API Management service is deployed."
  type        = string
}

variable "location" {
  description = "The Azure region where the API Management service is deployed."
  type        = string
}

variable "sku_name" {
  description = "The SKU of the API Management service (e.g., Developer, Basic, Standard, Premium)."
  type        = string
}

variable "publisher_name" {
  description = "The name of the API Management publisher."
  type        = string
}

variable "publisher_email" {
  description = "The email address of the API Management publisher."
  type        = string
}

variable "min_api_version" {
  description = "The minimum API version supported by the API Management service."
  type        = string
  default     = "2019-12-01"
}

variable "identity" {
  description = "The managed identity configuration for API Management."
  type = object({
    identity_ids = list(string)
    type         = string
  })
  default = {
    identity_ids = null
    type         = "SystemAssigned"
  }
}

variable "security" {
  description = "The security settings for the API Management service."
  type        = map(any)
}

variable "tags" {
  description = "A map of tags to apply to the API Management service."
  type        = map(string)
}

#-----------------------
# API Management Logger
#-----------------------
variable "api_management_logger_name" {
  description = "The name of the API Management Logger."
  type        = string
}

variable "resource_id" {
  description = "The resource ID of the destination for API logs (e.g., Log Analytics workspace or Event Hub)."
  type        = string
}

variable "instrumentation_key" {
  description = "The instrumentation key for Application Insights logging."
  type        = string
}

#---------------------------
# API Management Diagnostic
#---------------------------
variable "sampling_percentage" {
  description = "The percentage of requests to sample for diagnostic logging."
  type        = number
}

variable "always_log_errors" {
  description = "Whether to always log errors in API Management diagnostics."
  type        = bool
}

variable "log_client_ip" {
  description = "Whether to log the client IP address in API Management diagnostics."
  type        = bool
}

variable "verbosity" {
  description = "The verbosity level of API Management diagnostics (e.g., 'verbose', 'information', 'error')."
  type        = string
}

variable "http_correlation_protocol" {
  description = "The HTTP correlation protocol used for API Management diagnostics (e.g., 'Legacy', 'W3C')."
  type        = string
}