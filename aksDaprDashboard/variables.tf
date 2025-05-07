variable "release_name" {
  description = "Name of the DAPR dashbaord Helm release"
  type        = string
  default     = ""
}

variable "helm_version" {
  description = "version for DAPR dashbaord "
  type        = string
  default     = ""
}

variable "namespace" {
  description = "Namespace where DAPR dashbaord will be deployed"
  type        = string
  default     = ""
}

variable "environment" {}