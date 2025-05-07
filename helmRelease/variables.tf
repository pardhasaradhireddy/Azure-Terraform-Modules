#--------------
# Helm Release
#--------------
variable "name" {
  description = "(Required) Release name. The length must not be longer than 53 characters."
  type        = string
}

variable "chart" {
  description = "(Required) Chart name to be installed. A path may be used"
  type        = string
}

variable "chart_version" {
  description = "(Optional) Specify the exact chart version to install. If this is not specified, the latest version is installed."
  type        = string
  default     = null
}

variable "create_namespace" {
  description = "(Optional) Create the namespace if it does not exist. Defaults to false."
  type        = bool
  default     = false
}

variable "namespace" {
  description = "(Optional) Namespace to install the release into. Defaults to default."
  type        = string
  default     = "default"
}

variable "repository" {
  description = "(Optional) Repository where to locate the requested chart. If is a URL the chart is installed without installing the repository."
  type        = string
  default     = null
}

variable "replace" {
  description = "(Optional) Re-use the given name, even if that name is already used. This is unsafe in production. Defaults to false."
  type        = bool
  default     = false
}

variable "set" {
  description = "(Optional) Custom values to be merged with the values."
  type        = map(string)
  default     = {}
}