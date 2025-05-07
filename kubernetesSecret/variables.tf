#--------------------
# Kubernetes Secrets
#--------------------
variable "name" {}

variable "namespace" {}

variable "data" {
  default = null
}

variable "binary_data" {
  default = null
}

variable "type" {
  default = "Opaque"
}