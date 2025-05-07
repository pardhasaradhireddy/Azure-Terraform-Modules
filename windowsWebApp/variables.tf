#-----------------
# Windows Web App
#-----------------
variable "name" {
  description = "(Required) The name which should be used for this Windows Web App. Changing this forces a new Windows Web App to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the Resource Group where the Windows Web App should exist. Changing this forces a new Windows Web App to be created."
  type        = string
}

variable "location" {
  description = "(Required) The Azure Region where the Windows Web App should exist. Changing this forces a new Windows Web App to be created."
  type        = string
}

variable "service_plan_id" {
  description = "(Required) The ID of the Service Plan that this Windows App Service will be created in."
  type        = string
}

variable "site_config" {
  description = "(Required) A site_config block as defined below."
  type        = any
}

variable "app_settings" {
  description = "(Optional) A map of key-value pairs for App Settings and custom values."
  default     = {}
}

variable "auth_settings" {
  description = "(Optional) A auth_settings block as defined below."
  default     = {}
}

variable "auth_settings_v2" {
  description = "(Optional) A auth_settings_v2 block as defined below."
  default     = {}
}

variable "backup" {
  description = "(Optional) A backup block as defined below."
  default     = {}
}

variable "client_affinity_enabled" {
  description = "(Optional) Should Client Affinity be enabled?"
  type        = bool
  default     = null
}

variable "client_certificate_enabled" {
  description = "(Optional) Should Client Certificates be enabled?"
  type        = bool
  default     = null
}

variable "client_certificate_mode" {
  description = "(Optional) The Client Certificate mode. Possible values are Required, Optional, and OptionalInteractiveUser. This property has no effect when client_certificate_enabled is false. Defaults to Required."
  type        = string
  default     = "Required"
}

variable "client_certificate_exclusion_paths" {
  description = "(Optional) Paths to exclude when using client certificates, separated by ;"
  type        = any
  default     = null
}

variable "connection_string" {
  description = "(Optional) One or more connection_string blocks as defined below."
  default     = {}
}

variable "enabled" {
  description = "(Optional) Should the Windows Web App be enabled? Defaults to true"
  type        = bool
  default     = true
}

variable "ftp_publish_basic_authentication_enabled" {
  description = "(Optional) Should the default FTP Basic Authentication publishing profile be enabled. Defaults to true."
  type        = bool
  default     = true
}

variable "https_only" {
  description = "(Optional) Should the Windows Web App require HTTPS connections. Defaults to false."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "(Optional) Should public network access be enabled for the Web App. Defaults to true."
  type        = bool
  default     = true
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

variable "key_vault_reference_identity_id" {
  description = "(Optional) The User Assigned Identity ID used for accessing KeyVault secrets. The identity must be assigned to the application in the identity block."
  type        = string
  default     = null
}

variable "logs" {
  description = "(Optional) A logs block as defined below."
  default     = {}
}

variable "storage_account" {
  description = "(Optional) One or more storage_account blocks as defined below."
  default     = {}
}

variable "sticky_settings" {
  description = "(Optional) A sticky_settings block as defined below."
  default     = {}
}

variable "virtual_network_subnet_id" {
  description = "(Optional) The subnet id which will be used by this Web App for regional virtual network integration."
  type        = string
  default     = null
}

variable "webdeploy_publish_basic_authentication_enabled" {
  description = " (Optional) Should the default WebDeploy Basic Authentication publishing credentials enabled. Defaults to true."
  type        = bool
  default     = true
}

variable "zip_deploy_file" {
  description = "(Optional) The local path and filename of the Zip packaged application to deploy to this Windows Web App."
  type        = any
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags which should be assigned to the Windows Web App."
  type        = map(any)
  default     = {}
}

#-----------------
# Management Lock
#-----------------
variable "enable_management_lock" {
  description = "(Optional) Should the Windows Web App Management Lock be enabled? Defaults to false"
  default     = false
  type        = bool
}