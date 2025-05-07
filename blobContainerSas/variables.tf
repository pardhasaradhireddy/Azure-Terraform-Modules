variable "blob_storage_container_sas_expiry_in_years" {
  default = 3
}

variable "blob_storage_account_primary_connection_string" {}

variable "blob_storage_container_name" {}

variable "blob_storage_container_sas_permissions" {
  type = map(bool)
}

variable "cache_control" {
  default = ""
}
variable "content_disposition" {
  default = ""
}
variable "content_encoding" {
  default = ""
}

variable "content_language" {
  default = ""
}

variable "content_type" {
  default = "application/octet-stream"
}