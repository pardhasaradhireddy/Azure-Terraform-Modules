
variable "cms_product" {
  default = {
    product_id            = "cms-product",
    display_name          = "CMS APIs",
    subscription_required = true,
    subscription_limit    = 1,
    approval_required     = true,
    published             = false,
  }
}

variable "cms_validation_backend" {
  default = {
    name     = "cms_salesforce_validation_api",
    protocol = "http",
    tls = {
      validate_certificate_chain = true,
      validate_certificate_name  = true,
    },
  }
}

variable "cms_subscription_backend" {
  default = {
    name     = "cms_salesforce_subscription_api",
    protocol = "http",
    tls = {
      validate_certificate_chain = true,
      validate_certificate_name  = true,
    },
  }
}

variable "cms_security_backend" {
  default = {
    name     = "cms_salesforce_security_api",
    protocol = "http",
    tls = {
      validate_certificate_chain = true,
      validate_certificate_name  = true,
    },
  }
}

// list of apis to add to the cms product.
variable "cms_product_apis" {
  default = [
    "legacy",
  ]
}
