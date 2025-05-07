#---------------
# User Identity
#---------------
variable "name" {}

variable "resource_group_name" {}

variable "audience" {
  default = ["api://AzureADTokenExchange"]
}

variable "issuer" {
  default = "https://git.t3.daimlertruck.com/_services/token"
}

variable "identity_id" {}

variable "subject" {
  default = "repository_owner:CSG-NA"
}



