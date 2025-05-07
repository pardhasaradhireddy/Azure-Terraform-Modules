##################################
# api
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api
##################################

variable "pushgateway_api" {
  default = {
    name                  = "pushgateway",
    revision              = "1",
    display_name          = "pushgateway",
    path                  = "prometheus/push",
    protocols             = ["https"],
    service_protocol      = "https",
    subscription_required = true,
  }
}


##################################
# api operations
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation
##################################

variable "pushgateway_api_operations" {
  default = [
    # pushgateway POST
    {
      operation_id = "pushgateway-post",
      description  = "pushgateway POST pass through",
      display_name = "POST",
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
    # pushgateway GET
    {
      operation_id = "pushgateway-get",
      description  = "pushgateway GET pass through",
      display_name = "GET",
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
    # pushgateway PUT
    {
      operation_id = "pushgateway-put",
      description  = "pushgateway PUT pass through",
      display_name = "PUT",
      method       = "PUT",
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
    # pushgateway DELETE
    {
      operation_id = "pushgateway-DELETE",
      description  = "pushgateway DELETE pass through",
      display_name = "DELETE",
      method       = "DELETE",
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
