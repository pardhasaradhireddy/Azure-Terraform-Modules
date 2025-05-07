
variable "truckconnect_product" {
  default = {
    product_id            = "truckconnect-product",
    display_name          = "Truck Connect Portal",
    subscription_required = true,
    subscription_limit    = 1,
    approval_required     = true,
    published             = false,
  }
}

// list of apis to add to the truck connect product.
variable "truckconnect_product_apis" {
  default = [
    "eb_truckconnect"
  ]
}
