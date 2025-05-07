##################################
# api
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api
##################################

variable "predmain_api" {
  default = {
    name                  = "predmain",
    revision              = "1",
    display_name          = "predmain",
    path                  = "predmain",
    protocols             = ["https"],
    service_path          = "predmain/v1",
    service_protocol      = "https",
    subscription_required = true,
    version               = "v1",
  }
}

##################################
# api version set
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set
##################################

variable "predmain_api_version_set" {
  default = {
    name              = "predmain-version-set",
    display_name      = "predmain",
    versioning_scheme = "Segment"
  }
}

##################################
# api operations
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation
##################################

variable "predmain_api_operations" {
  default = [
    # demo READ w/ OID
    {
      operation_id = "predmain-read-with-oid",
      description  = "predmain READ with User Object ID",
      display_name = "READ w/ OID",
      method       = "GET",
      url_template = "/"
      request = {
        description = "READ a list of user TAN values with a user Object ID.",
        headers     = [],
        query_parameters = [
          {
            name          = "oid",
            required      = true,
            type          = "string",
            description   = "User Object ID",
            default_value = null,
            values        = null,
          },
        ],
        representations = [],
      },
      responses = [
        {
          status_code = 200,
          description = "success",
        },
        {
          status_code = 500,
          description = "internal server error",
        },
      ],
      template_parameters = [],
    },
  ]
}

variable "predmain_product" {
  default = {
    product_id            = "predmain-product",
    display_name          = "Predictive Maintenance",
    subscription_required = true,
    subscription_limit    = 1,
    approval_required     = true,
    published             = false,
  }
}

// list of apis to add to the DCP product.
variable "predmain_product_apis" {
  default = ["predmain"]
}
