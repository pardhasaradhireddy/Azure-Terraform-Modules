##################################
# api
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api
##################################

variable "platformtest_api" {
  default = {
    name                  = "platformtest",
    revision              = "1",
    display_name          = "platformtest",
    path                  = "platformtest",
    protocols             = ["https"],
    service_protocol      = "https",
    subscription_required = true,
  }
}


##################################
# api operations
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation
##################################

variable "platformtest_api_operations" {
  default = [
    # platformtest CREATE
    {
      operation_id = "platformtest-create",
      description  = "platformtest create pass through",
      display_name = "CREATE",
      method       = "POST",
      url_template = "/*"
      responses = [
        {
          status_code = 200,
          description = "success",
        },
        {
          status_code = 400,
          description = "bad request",
        },
        {
          status_code = 404,
          description = "not found",
        },
        {
          status_code = 500,
          description = "internal server error",
        },
      ],
    },
    # platformtest READ
    {
      operation_id = "platformtest-read",
      description  = "platformtest read pass through",
      display_name = "READ",
      method       = "GET",
      url_template = "/*"
      responses = [
        {
          status_code = 200,
          description = "success",
        },
        {
          status_code = 400,
          description = "bad request",
        },
        {
          status_code = 404,
          description = "not found",
        },
        {
          status_code = 500,
          description = "internal server error",
        },
      ],
    },
  ]
}

variable "platformtest_product_apis" {
  default = [
    "platformtest",
  ]
}
