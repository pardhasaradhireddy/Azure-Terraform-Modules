variable "release_name" {
  description = "Name of the LOKI Helm release"
  type        = string
  default     = ""
}

variable "helm_version" {
  description = "version for LOKI "
  type        = string
  default     = ""
}

variable "namespace" {
  description = "Namespace where LOKI will be deployed"
  type        = string
  default     = ""
}

variable "backend" {
  type = object({
    storage_account_name = string
    user_assigned_id     = string
  })
  default = {
    storage_account_name : "stacaksbackupdevcus"
    user_assigned_id : "1a842504-0179-4120-b5e1-5180e07c9321"
  }
}

variable "retention" {
  default = "168h"
  type    = string
}