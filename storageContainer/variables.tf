#-------------------
# Storage Container
#-------------------
variable "storage_container_name" {
  description = "The name of the storage container"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account where the container will be created (optional if storage_account_id is provided)"
  type        = string
  default     = null
}

variable "storage_account_id" {
  description = "The ID of the storage account where the container will be created (optional if storage_account_name is provided)"
  type        = string
  default     = null
}

variable "container_access_type" {
  description = "The level of public access for the container (e.g., private, blob, container)"
  type        = string
}

variable "metadata" {
  description = "Metadata key-value pairs for the storage container"
  type        = map(string)
  default     = {}
}