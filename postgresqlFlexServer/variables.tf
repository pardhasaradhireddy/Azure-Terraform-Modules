#----------------------------
# PostgreSQL Flexible Server
#----------------------------
variable "psqlflexibleserver_name" {
  description = "The name of the PostgreSQL Flexible Server instance."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "The name of the resource group where the PostgreSQL Flexible Server will be created."
  type        = string
  default     = null
}

variable "location" {
  description = "The Azure region where the PostgreSQL Flexible Server will be created."
  type        = string
  default     = null
}

variable "psql_version" {
  description = "The version of PostgreSQL to use for the Flexible Server."
  type        = string
  default     = "15"
}

variable "delegated_subnet_id" {
  description = "The resource ID of the delegated subnet for the PostgreSQL Flexible Server."
  type        = string
  default     = null
}

variable "private_dns_zone_id" {
  description = "The resource ID of the private DNS zone to associate with the PostgreSQL Flexible Server."
  type        = string
  default     = null
}

variable "administrator_login" {
  description = "The administrator login name for the PostgreSQL Flexible Server."
  type        = string
  default     = "saitama"
}

variable "administrator_password" {
  description = "The administrator password for the PostgreSQL Flexible Server."
  type        = string
  default     = null
}

variable "zone" {
  description = "The availability zone to deploy the PostgreSQL Flexible Server in."
  type        = string
  default     = null
}

variable "storage_mb" {
  description = "The maximum storage size in megabytes for the PostgreSQL Flexible Server."
  type        = string
  default     = "32768"
}

variable "sku_name" {
  description = "The SKU name for the PostgreSQL Flexible Server instance."
  type        = string
  default     = "B_Standard_B1ms"
}

variable "auto_grow_enabled" {
  description = "Determines whether auto-grow is enabled for storage on the PostgreSQL Flexible Server."
  type        = bool
  default     = true
}

variable "identity" {
  description = "The managed identity configuration for the PostgreSQL Flexible Server."
  type = object({
    identity_ids = list(string)
    type         = string
  })
  default = {
    identity_ids = null
    type         = "SystemAssigned"
  }
}

variable "tags" {
  description = "A map of tags to assign to the PostgreSQL Flexible Server resource."
  type        = map(string)
  default     = {}
}