variable "app_configuration_name" {
  description = "AzureAppConfiguration kubernetes provider Helm release"
  type        = string
  default     = ""
}

variable "namespace" {
  description = "Namespace where AzureAppConfiguration kubernetes provider will be deployed"
  type        = string
  default     = ""
}
