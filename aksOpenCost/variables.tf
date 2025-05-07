variable "release_name" {
  description = "Name of the Helm release"
}

variable "chart_repository" {
  description = "Repository containing the OpenCost Helm chart"
}

variable "chart_name" {
  description = "Name of the OpenCost Helm chart"
}

variable "chart_version" {
  description = "Version of the OpenCost Helm chart"
}

variable "namespace" {
  description = "Kubernetes namespace for deploying OpenCost"
}

# variable "kustomize_version" {
#   description = "Version of Kustomize to install"
#   type        = string
#   default     = "v4.4.0"
# }
variable "tenant_id" {}

variable "subscription_id" {}


variable "secret_key" {}

variable "app_id" {}
