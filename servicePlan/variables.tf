#--------------
# Service Plan
#--------------
variable "name" {
  description = "(Required) The name which should be used for this Service Plan. Changing this forces a new Service Plan to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the Resource Group where the Service Plan should exist. Changing this forces a new Service Plan to be created."
  type        = string
}

variable "location" {
  description = "(Required) The Azure Region where the Service Plan should exist. Changing this forces a new Service Plan to be created."
  type        = string
}

variable "os_type" {
  description = "(Required) The O/S type for the App Services to be hosted in this plan. Possible values include Windows, Linux, and WindowsContainer. Changing this forces a new resource to be created."
  type        = string
}

variable "sku_name" {
  description = "(Required) The SKU for the plan. Possible values include B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, I4v2, I5v2, I6v2, P1v2, P2v2, P3v2, P0v3, P1v3, P2v3, P3v3, P1mv3, P2mv3, P3mv3, P4mv3, P5mv3, S1, S2, S3, SHARED, EP1, EP2, EP3, FC1, WS1, WS2, WS3, and Y1."
  type        = string
}

variable "app_service_environment_id" {
  description = "(Optional) The ID of the App Service Environment to create this Service Plan in."
  type        = string
  default     = null
}

variable "maximum_elastic_worker_count" {
  description = "(Optional) The maximum number of workers to use in an Elastic SKU Plan. Cannot be set unless using an Elastic SKU."
  type        = number
  default     = null
}

variable "worker_count" {
  description = "(Optional) The number of Workers (instances) to be allocated."
  type        = number
  default     = 1
}

variable "per_site_scaling_enabled" {
  description = "(Optional) Should Per Site Scaling be enabled. Defaults to false."
  type        = bool
  default     = false
}

variable "zone_balancing_enabled" {
  description = "(Optional) Should the Service Plan balance across Availability Zones in the region. Changing this forces a new resource to be created."
  type        = bool
  default     = false
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

#-----------------
# Management Lock
#-----------------
variable "enable_management_lock" {
  default = true
}