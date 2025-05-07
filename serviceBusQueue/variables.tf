#------------------
# ServiceBus Queue
#------------------
variable "servicebus_queue_name" {
  description = "(Required) Specifies the name of the ServiceBus Queue resource. Changing this forces a new resource to be created."
  type        = string
}

variable "servicebus_id" {
  description = "(Required) The ID of the ServiceBus Namespace to create this queue in. Changing this forces a new resource to be created."
  type        = string
}

variable "lock_duration" {
  description = "(Optional) The ISO 8601 timespan duration of a peek-lock; that is, the amount of time that the message is locked for other receivers. Maximum value is 5 minutes. Defaults to 1 minute (PT1M)."
  type        = string
  default     = "PT1M"
}

variable "max_message_size_in_kilobytes" {
  description = "(Optional) Integer value which controls the maximum size of a message allowed on the queue for Premium SKU."
  type        = number
  default     = null
}

variable "max_size_in_megabytes" {
  description = "(Optional) Integer value which controls the size of memory allocated for the queue."
  type        = number
  default     = null
}

variable "requires_duplicate_detection" {
  description = "(Optional) Boolean flag which controls whether the Queue requires duplicate detection. Changing this forces a new resource to be created. Defaults to false."
  type        = bool
  default     = false
}

variable "requires_session" {
  description = "(Optional) Boolean flag which controls whether the Queue requires sessions. This will allow ordered handling of unbounded sequences of related messages. With sessions enabled a queue can guarantee first-in-first-out delivery of messages. Changing this forces a new resource to be created. Defaults to false."
  type        = bool
  default     = false
}

variable "default_message_ttl" {
  description = "(Optional) The ISO 8601 timespan duration of the TTL of messages sent to this queue. This is the default value used when TTL is not set on message itself."
  type        = string
  default     = null
}

variable "dead_lettering_on_message_expiration" {
  description = "(Optional) Boolean flag which controls whether the Queue has dead letter support when a message expires. Defaults to false."
  type        = bool
  default     = false
}

variable "duplicate_detection_history_time_window" {
  description = "(Optional) The ISO 8601 timespan duration during which duplicates can be detected. Defaults to 10 minutes (PT10M)."
  type        = string
  default     = "PT10M"
}

variable "max_delivery_count" {
  description = "(Optional) Integer value which controls when a message is automatically dead lettered. Defaults to 10."
  type        = number
  default     = 10
}

variable "status" {
  description = "(Optional) The status of the Queue. Possible values are Active, Creating, Deleting, Disabled, ReceiveDisabled, Renaming, SendDisabled, Unknown. Note that Restoring is not accepted. Defaults to Active."
  type        = string
  default     = "Active"
}

variable "batched_operations_enabled" {
  description = "(Optional) Boolean flag which controls whether server-side batched operations are enabled. Defaults to true."
  type        = bool
  default     = true
}

variable "auto_delete_on_idle" {
  description = "(Optional) The ISO 8601 timespan duration of the idle interval after which the Queue is automatically deleted, minimum of 5 minutes."
  type        = bool
  default     = null
}

variable "partitioning_enabled" {
  description = "(Optional) Boolean flag which controls whether to enable the queue to be partitioned across multiple message brokers. Changing this forces a new resource to be created. Defaults to false for Basic and Standard."
  type        = bool
  default     = false
}

variable "express_enabled" {
  description = "(Optional) Boolean flag which controls whether Express Entities are enabled. An express queue holds a message in memory temporarily before writing it to persistent storage. Defaults to false for Basic and Standard. For Premium, it MUST be set to false."
  type        = bool
  default     = false
}

variable "forward_to" {
  description = "(Optional) The name of a Queue or Topic to automatically forward messages to."
  type        = string
  default     = null
}

variable "forward_dead_lettered_messages_to" {
  description = "(Optional) The name of a Queue or Topic to automatically forward dead lettered messages to."
  type        = string
  default     = null
}

#------------------
# Key Vault Secret
#------------------
variable "key_vault_id" {
  description = "Key Vault ID"
  type        = string
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

#-----------------
# Role Assignment
#-----------------
variable "rbac_principal_id" {
  description = "Object Id of the user or application to which access to be provided."
  type        = list(any)
  default     = []
}

variable "role_definition_name" {
  description = "Role Definition Name"
  type        = string
  default     = "Azure Event Hubs Data owner"
}