#-------------------------
# Log Analytics Workspace
#-------------------------
variable "name" {
  description = "(Required) Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which the Log Analytics workspace is created. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "allow_resource_only_permissions" {
  description = "(Optional) Specifies if the log Analytics Workspace allow users accessing to data associated with resources they have permission to view, without permission to workspace. Defaults to true."
  type        = bool
  default     = true
}

variable "local_authentication_disabled" {
  description = "(Optional) Specifies if the log Analytics workspace should enforce authentication using Azure AD. Defaults to false."
  type        = bool
  default     = false
}

variable "sku" {
  description = "(Optional) Specifies the SKU of the Log Analytics Workspace. Possible values are PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018 (new SKU as of 2018-04-03). Defaults to PerGB2018."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "(Optional) The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
  type        = string
  default     = null
}

variable "daily_quota_gb" {
  description = "(Optional) The workspace daily quota for ingestion in GB. Defaults to -1 (unlimited) if omitted."
  type        = number
  default     = -1
}

variable "cmk_for_query_forced" {
  description = "(Optional) Is Customer Managed Storage mandatory for query management?"
  type        = string
  default     = null
}

variable "identity" {
  description = "(Optional) An identity block as defined below."
  default = {
    type         = "SystemAssigned"
    identity_ids = []
  }
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
}

variable "internet_ingestion_enabled" {
  description = "(Optional) Should the Log Analytics Workspace support ingestion over the Public Internet? Defaults to true."
  type        = bool
  default     = true
}

variable "internet_query_enabled" {
  description = "(Optional) Should the Log Analytics Workspace support querying over the Public Internet? Defaults to true."
  type        = bool
  default     = true
}

variable "reservation_capacity_in_gb_per_day" {
  description = "(Optional) The capacity reservation level in GB for this workspace. Possible values are 100, 200, 300, 400, 500, 1000, 2000 and 5000."
  type        = string
  default     = null
}

variable "data_collection_rule_id" {
  description = "(Optional) The ID of the Data Collection Rule to use for this workspace."
  type        = string
  default     = null
}

variable "immediate_data_purge_on_30_days_enabled" {
  description = "(Optional) Whether to remove the data in the Log Analytics Workspace immediately after 30 days."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
}