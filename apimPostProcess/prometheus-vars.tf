##################################
# api
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api
##################################

variable "prometheus_api" {
  default = {
    name                  = "prometheus",
    revision              = "1",
    display_name          = "prometheus",
    path                  = "prometheus/kube/prometheus/prometheus",
    protocols             = ["https"],
    service_protocol      = "https",
    subscription_required = true,
  }
}


##################################
# api operations
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation
##################################

variable "prometheus_api_operations" {
  default = [
    # prometheus CREATE
    {
      operation_id = "prometheus-create",
      description  = "prometheus create pass through",
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
    # prometheus READ
    {
      operation_id = "prometheus-read",
      description  = "prometheus read pass through",
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