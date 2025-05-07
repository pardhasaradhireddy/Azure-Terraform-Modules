variable "release_name" {
  description = "Name of the DAPR Helm release"
  type        = string
  default     = ""
}

variable "helm_version" {
  description = "Helm version for DAPR "
  type        = string
  default     = ""
}

variable "namespace" {
  description = "Namespace where DAPR will be deployed"
  type        = string
  default     = ""
}
