#----------------------
# Application Insights
#----------------------
variable "name" {
  type        = string
  description = "The name of the Application Insights resource."
}

variable "location" {
  type        = string
  description = "The Azure region where the Application Insights resource will be deployed."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Application Insights resource."
}

variable "application_type" {
  type        = string
  default     = "web"
  description = "The type of application being monitored. Possible values are 'web', 'other', etc."
}

variable "daily_data_cap_in_gb" {
  type        = number
  default     = null
  description = "The daily data volume cap in GB. If set, this limits the amount of data ingested per day."
}

variable "retention_in_days" {
  type        = number
  default     = 365
  description = "The number of days to retain Application Insights data."
}

variable "daily_data_cap_notifications_disabled" {
  type        = bool
  default     = null
  description = "Indicates whether notifications for exceeding the daily data cap are disabled."
}

variable "sampling_percentage" {
  type        = number
  default     = null
  description = "The percentage of telemetry data sampled for ingestion, between 0 and 100."
}

variable "disable_ip_masking" {
  type        = bool
  default     = false
  description = "Specifies whether IP masking is disabled. If true, client IP addresses will be stored."
}

variable "workspace_id" {
  type        = string
  default     = null
  description = "The ID of the Log Analytics workspace to link with Application Insights."
}

variable "local_authentication_disabled" {
  type        = bool
  default     = false
  description = "Specifies whether local authentication (instrumentation key-based authentication) is disabled."
}

variable "internet_ingestion_enabled" {
  type        = bool
  default     = true
  description = "Controls whether ingestion of telemetry data over the public internet is enabled."
}

variable "internet_query_enabled" {
  type        = bool
  default     = true
  description = "Controls whether queries to Application Insights over the public internet are enabled."
}

variable "force_customer_storage_for_profiler" {
  type        = bool
  default     = false
  description = "Specifies whether customer-managed storage is required for the profiler feature."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to apply to the Application Insights resource."
}