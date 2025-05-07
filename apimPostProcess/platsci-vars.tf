
variable "platsci_product" {
  default = {
    product_id            = "platsci-product",
    display_name          = "PlatformScience APIs",
    subscription_required = true,
    subscriptions_limit   = 1,
    approval_required     = true,
    published             = false,
  }
}
