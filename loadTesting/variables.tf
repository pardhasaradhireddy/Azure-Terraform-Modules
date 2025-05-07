variable "resource_group_name" {
  description = "Name of the Azure resource group."
}

variable "location" {
  description = "Azure region where resources will be deployed."
}

variable "name" {
  description = "Load test name"
}

variable "description" {
  default = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

variable "identity" {
  type = any
  default = {
    type = "SystemAssigned"
  }
}
