
variable "dcp_product" {
  default = {
    product_id            = "dcp-product",
    display_name          = "Detroit Connect Portal",
    subscription_required = true,
    subscription_limit    = 1,
    approval_required     = true,
    published             = false,
  }
}

variable "dcp_backend" {
  default = {
    name     = "dcp-agic",
    protocol = "http",
    tls = {
      validate_certificate_chain = false,
      // TODO: enable when we have agic certs in all environments
      validate_certificate_name = false,
    },
  }
}

// list of apis to add to the DCP product.
variable "dcp_product_apis" {
  default = [
    "legacy",
  ]
}
