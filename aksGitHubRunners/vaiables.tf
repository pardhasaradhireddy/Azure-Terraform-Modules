#--------------------
# AKS GitHub Runners
#--------------------
variable "chart_version" {
  description = "(Optional) Specify the exact chart version to install. If this is not specified, the latest version is installed."
  type        = string
  default     = "0.23.7"
}

variable "GITHUB-RUNNERS-PAT" {}

variable "github_runners_image_version" {}