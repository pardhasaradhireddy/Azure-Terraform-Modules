variable "geotab_product" {
  default = {
    product_id            = "geotab-product",
    display_name          = "Geotab APIs",
    subscription_required = true,
    subscriptions_limit   = 1,
    approval_required     = true,
    published             = false,
  }
}