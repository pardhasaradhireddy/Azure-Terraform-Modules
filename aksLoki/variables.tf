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

variable "persistanceVolumeSize" {
  type    = string
  default = "16Gi"
}

variable "loki_memory_request" {
  description = "Memory request for Loki"
  type        = string
}

variable "retention_period" {
  description = "Retention period for Loki logs"
  type        = string
}

variable "loki_memory_limit" {
  description = "Memory limit for Loki"
  type        = string
}