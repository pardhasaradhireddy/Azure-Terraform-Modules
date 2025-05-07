#--------------------
# Linux Function App
#--------------------
variable "name" {
  description = "(Required) The name which should be used for this Linux Function App. Changing this forces a new Linux Function App to be created. Limit the function name to 32 characters to avoid naming collisions."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the Resource Group where the Linux Function App should exist. Changing this forces a new Linux Function App to be created."
  type        = string
}

variable "location" {
  description = "(Required) The Azure Region where the Linux Function App should exist. Changing this forces a new Linux Function App to be created."
  type        = string
}

variable "service_plan_id" {
  description = "(Required) The ID of the App Service Plan within which to create this Function App."
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

variable "builtin_logging_enabled" {
  description = "(Optional) Should built in logging be enabled. Configures AzureWebJobsDashboard app setting based on the configured storage setting. Defaults to true."
  type        = bool
  default     = true
}

variable "client_certificate_enabled" {
  description = "(Optional) Should the function app use Client Certificates."
  type        = bool
  default     = null
}

variable "client_certificate_mode" {
  description = "(Optional) The mode of the Function App's client certificates requirement for incoming requests. Possible values are Required, Optional, and OptionalInteractiveUser. Defaults to Optional."
  type        = string
  default     = "Optional"
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

variable "daily_memory_time_quota" {
  description = "(Optional) The amount of memory in gigabyte-seconds that your application is allowed to consume per day. Setting this value only affects function apps under the consumption plan. Defaults to 0."
  type        = number
  default     = "0"
}

variable "enabled" {
  description = "(Optional) Is the Function App enabled? Defaults to true."
  type        = bool
  default     = true
}

variable "content_share_force_disabled" {
  description = "(Optional) Should the settings for linking the Function App to storage be suppressed."
  type        = bool
  default     = null
}

variable "functions_extension_version" {
  description = "(Optional) The runtime version associated with the Function App. Defaults to ~4."
  type        = any
  default     = "~4"
}

variable "ftp_publish_basic_authentication_enabled" {
  description = "(Optional) Should the default FTP Basic Authentication publishing profile be enabled. Defaults to true."
  type        = bool
  default     = true
}

variable "https_only" {
  description = "(Optional) Can the Function App only be accessed via HTTPS? Defaults to false."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "(Optional) Should public network access be enabled for the Function App. Defaults to true."
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

variable "storage_account" {
  description = "(Optional) One or more storage_account blocks as defined below."
  default     = {}
}

variable "sticky_settings" {
  description = "(Optional) A sticky_settings block as defined below."
  default     = {}
}

variable "storage_account_access_key" {
  description = "(Optional) The access key which will be used to access the backend storage account for the Function App. Conflicts with storage_uses_managed_identity."
  type        = string
  default     = null
}

variable "storage_account_name" {
  description = "(Optional) The backend storage account name which will be used by this Function App."
  type        = string
  default     = null
}

variable "storage_uses_managed_identity" {
  description = "(Optional) Should the Function App use Managed Identity to access the storage account. Conflicts with storage_account_access_key."
  type        = bool
  default     = null
}

variable "storage_key_vault_secret_id" {
  description = "(Optional) The Key Vault Secret ID, optionally including version, that contains the Connection String to connect to the storage account for this Function App."
  type        = string
  default     = null
}

variable "virtual_network_subnet_id" {
  description = "(Optional) The subnet id which will be used by this Function App for regional virtual network integration."
  type        = string
  default     = null
}

variable "webdeploy_publish_basic_authentication_enabled" {
  description = "(Optional) Should the default WebDeploy Basic Authentication publishing credentials enabled. Defaults to true."
  type        = bool
  default     = true
}

variable "zip_deploy_file" {
  description = "(Optional) The local path and filename of the Zip packaged application to deploy to this Linux Function App."
  type        = any
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags which should be assigned to the Linux Function App."
  type        = map(any)
  default     = {}
}

#-----------------
# Management Lock
#-----------------
variable "enable_management_lock" {
  description = "(Optional) Should the Linux Function App Management Lock be enabled? Defaults to false"
  type        = bool
  default     = false
}