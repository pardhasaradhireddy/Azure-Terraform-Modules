#----------
# EventHub
#----------
variable "eventhub_name" {
  description = "(Required) Specifies the name of the EventHub resource. Changing this forces a new resource to be created."
  type        = string
}

variable "eventhub_namespace" {
  description = "(Required) Specifies the name of the EventHub Namespace. Changing this forces a new resource to be created."
  type        = string
}

variable "eventhub_rg" {
  description = "(Required) The name of the resource group in which the EventHub's parent Namespace exists. Changing this forces a new resource to be created."
  type        = string
}

variable "partition_count" {
  description = "(Required) Specifies the current number of shards on the Event Hub."
  type        = number
}

variable "message_retention" {
  description = "(Required) Specifies the number of days to retain the events for this Event Hub."
  type        = number
}

variable "capture_description" {
  description = "(Optional) A capture_description block as defined below."
  default     = {}
}

variable "status" {
  description = "(Optional) Specifies the status of the Event Hub resource. Possible values are Active, Disabled and SendDisabled. Defaults to Active."
  type        = string
  default     = "Active"
}

#--------------------------
# EventHub Consumer Groups
#--------------------------
variable "consumer_group_list" {
  description = "Consumer Group List"
  type        = list(any)
  default     = []
}

#-------------------
# Key Vault Secrets
#-------------------
variable "key_vault_id" {
  description = "(Required) Key Vault ID."
  type        = string
}

variable "tags" {
  description = "(Optional) A mapping of tags which should be assigned to Key Vault Secrets."
  type        = map(any)
  default     = {}
}

#------------------
# Role Assignments
#------------------
variable "rbac_principal_id" {
  description = "Object Id of the user or application to which access to be provided."
  type        = list(any)
  default     = []
}

variable "role_definition_name" {
  description = "role defination name"
  type        = string
  default     = "Azure Event Hubs Data owner"
}