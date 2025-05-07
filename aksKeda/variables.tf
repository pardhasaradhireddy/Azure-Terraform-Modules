variable "release_name" {
  description = "Name of the KEDA Helm release"
  type        = string
  default     = ""
}

variable "helm_version" {
  description = "Helm Version for Keda"
  type        = string
  default     = ""
}

variable "namespace" {
  description = "Namespace where KEDA will be deployed"
  type        = string
  default     = ""
}
