#-----------------
# Random Password
#-----------------
variable "length" {
  default = "24"
}

variable "lower" {
  default = true
}

variable "min_lower" {
  default = "2"
}

variable "min_numeric" {
  default = "2"
}

variable "min_special" {
  default = "2"
}

variable "min_upper" {
  default = "2"
}

variable "numeric" {
  default = true
}

variable "override_special" {
  default = "!@#$%&*()-_=+[]{}<>:?"
}

variable "special" {
  default = true
}

variable "upper" {
  default = true
}