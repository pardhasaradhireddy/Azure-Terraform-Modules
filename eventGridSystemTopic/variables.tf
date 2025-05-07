#---------------
# Event Grid System Topic
#---------------
variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_account_id" {
  type = string
}

variable "identity" {
  default = {
    identity_ids = null
    type         = "SystemAssigned"
  }
}

variable "tags" {
  default = {}
}
