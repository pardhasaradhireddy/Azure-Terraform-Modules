#-------------------------
# Azure Monitor Workspace
#-------------------------
variable "monitor_workspace_name" {
  description = "The name of the Azure Monitor Workspace."
  default     = null
}

variable "resource_group_name" {
  description = "The name of the resource group where the Azure Monitor Workspace will be created."
  default     = null
}

variable "location" {
  description = "The Azure region where the Azure Monitor Workspace will be created."
  default     = null
}

variable "public_network_access_enabled" {
  description = "Specifies whether public network access is enabled for the Azure Monitor Workspace."
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to the Azure Monitor Workspace."
  default     = {}
}