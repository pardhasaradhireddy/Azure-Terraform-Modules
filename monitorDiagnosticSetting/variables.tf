#----------------------------
# Monitor Diagnostic Setting
#----------------------------
variable "name" {
  description = "(Required) Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created."
  type        = string
}

variable "target_resource_id" {
  description = "(Required) The ID of an existing Resource on which to configure Diagnostic Settings. Changing this forces a new resource to be created."
  type        = string
}

variable "eventhub_name" {
  description = "(Optional) Specifies the name of the Event Hub where Diagnostics Data should be sent."
  type        = string
  default     = null
}

variable "eventhub_authorization_rule_id" {
  description = "(Optional) Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data."
  type        = string
  default     = null
}

variable "enabled_log" {
  description = "A map containing enabled log configurations. Each entry must specify either 'category' or 'category_group', but not both."

  type = map(object({
    category       = optional(string)
    category_group = optional(string)
  }))

  validation {
    condition     = alltrue([for k, v in var.enabled_log : (v.category != null && v.category_group == null) || (v.category == null && v.category_group != null)])
    error_message = "Exactly one of 'category' or 'category_group' must be specified for each entry in 'enabled_log'."
  }
}

variable "log_analytics_workspace_id" {
  description = "(Optional) Specifies the ID of a Log Analytics Workspace where Diagnostics Data should be sent."
  type        = string
  default     = null
}

variable "metric" {
  description = "(Optional) One or more metric blocks as defined below."
  type        = any
  default     = {}
}

variable "storage_account_id" {
  description = "(Optional) The ID of the Storage Account where logs should be sent."
  type        = string
  default     = null
}

variable "log_analytics_destination_type" {
  description = " (Optional) Possible values are AzureDiagnostics and Dedicated. When set to Dedicated, logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table."
  type        = string
  default     = null
}

variable "partner_solution_id" {
  description = " (Optional) The ID of the market partner solution where Diagnostics Data should be sent."
  type        = string
  default     = null
}