#-----------------------
# Service Bus Namespace
#-----------------------
variable "servicebus_ns_name" {
  description = "(Required) Specifies the name of the ServiceBus Namespace resource . Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to Changing this forces a new resource to be created. create the namespace."
  type        = string
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "sku" {
  description = "(Required) Defines which tier to use. Options are Basic, Standard or Premium. Please note that setting this field to Premium will force the creation of a new resource."
  type        = string
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

variable "capacity" {
  description = "(Optional) Specifies the capacity. When sku is Premium, capacity can be 1, 2, 4, 8 or 16. When sku is Basic or Standard, capacity can be 0 only."
  type        = number
  default     = null
}

variable "premium_messaging_partitions" {
  description = "(Optional) Specifies the number messaging partitions. Only valid when sku is Premium and the minimum number is 1. Possible values include 0, 1, 2, and 4. Defaults to 0 for Standard, Basic namespace. Changing this forces a new resource to be created."
  type        = number
  default     = null
}

variable "customer_managed_key" {
  description = "(Optional) An customer_managed_key block as defined below."
  type        = any
  default     = {}
}

variable "local_auth_enabled" {
  description = "(Optional) Whether or not SAS authentication is enabled for the Service Bus namespace. Defaults to true."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "(Optional) Is public network access enabled for the Service Bus Namespace? Defaults to true."
  type        = bool
  default     = true
}

variable "minimum_tls_version" {
  description = "(Optional) The minimum supported TLS version for this Service Bus Namespace. Valid values are: 1.0, 1.1 and 1.2. Defaults to 1.2."
  type        = number
  default     = 1.2
}

variable "network_rule_set" {
  description = "(Optional) An network_rule_set block as defined below."
  type        = any
  default     = {}
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

#------------------
# ServiceBus Queue
#------------------
variable "queues" {
  default = {}
}

variable "key_vault_id" {
  description = "Key Vault ID"
  type        = string
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