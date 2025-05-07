#---------------
# Event Grid System Topic Event Subscription
#---------------
variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "system_topic_name" {
  type = string
}

variable "filter_begins_with" {
  type = string
}

variable "azure_function_id" {
  type = string
}

variable "included_event_types" {
  type = list(string)
}
