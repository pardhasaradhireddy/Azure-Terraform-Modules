variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "service_plan_id" {
  type = string
}

variable "app_settings" {
  default = {}
}

variable "auth_settings" {
  default = {}
}

variable "connection_string" {
  default = {}
}

variable "daily_memory_time_quota" {
  type    = number
  default = 0
}

variable "enabled" {
  type    = bool
  default = true
}

variable "enable_builtin_logging" {
  type    = bool
  default = true
}

variable "https_only" {
  type    = bool
  default = true
}


variable "identity" {
  default = {
    identity_ids = null
    type         = "SystemAssigned"
  }
}

variable "key_vault_reference_identity_id" {
  type    = string
  default = null
}

variable "os_type" {
  type    = string
  default = ""
}

variable "site_config" {
  default = {}
}

variable "source_control" {
  default = {}
}

variable "app_version" {
  type    = string
  default = "~4"
}

variable "sticky_settings" {
  default = {}
}

variable "backup" {
  default = {}
}

variable "storage_account" {
  default = {}
}

variable "storage_account_access_key" {
  default = null
}

variable "storage_account_name" {
  default = null
}

variable "storage_uses_managed_identity" {
  default = null
}

variable "storage_key_vault_secret_id" {
  default = null
}

variable "virtual_network_subnet_id" {
  default = null
}

variable "builtin_logging_enabled" {
  default = null
}

variable "client_certificate_enabled" {
  default = null
}

variable "client_certificate_mode" {
  default = null
}

variable "client_certificate_exclusion_paths" {
  default = null
}

variable "content_share_force_disabled" {
  default = null
}

variable "functions_extension_version" {
  default = null
}

variable "tags" {}