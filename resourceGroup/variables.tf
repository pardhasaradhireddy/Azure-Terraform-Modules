#----------------
# Resource Group
#----------------
variable "name" {
  description = "(Required) The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
  type        = string
}

variable "location" {
  description = "(Required) The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
  type        = string
}

variable "managed_by" {
  description = "(Optional) The ID of the resource or application that manages this Resource Group."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

#-----------------
# Role Assignment
#-----------------
variable "roleAssignment" {
  description = "(Optional) Role Assignment for Resource Group"
  type        = any
  default     = []
}