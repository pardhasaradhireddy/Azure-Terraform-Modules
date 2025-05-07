
variable "api-authority-product" {
  default = {
    product_id            = "api-authority-product",
    display_name          = "Customer API Authority APIs",
    subscription_required = true,
    subscription_limit    = 1,
    approval_required     = true,
    published             = false,
  }
}