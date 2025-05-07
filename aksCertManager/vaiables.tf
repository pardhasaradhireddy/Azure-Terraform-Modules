#------------------
# AKS Cert Manager
#------------------
variable "chart_version" {
  description = "(Optional) Specify the exact chart version to install. If this is not specified, the latest version is installed."
  type        = string
  default     = "v1.16.1"
}