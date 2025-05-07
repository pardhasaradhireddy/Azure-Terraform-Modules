variable "release_name" {
  description = "Name of the AWX dashbaord Helm release"
  type        = string
  default     = ""
}

variable "helm_version" {
  description = "version for AWX dashbaord "
  type        = string
  default     = ""
}

variable "namespace" {
  description = "Namespace where AWX dashbaord will be deployed"
  type        = string
  default     = ""
}

variable "environment" {}