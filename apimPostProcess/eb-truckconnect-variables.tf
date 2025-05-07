##################################
# api
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api
##################################

variable "eb_truckconnect_api" {
  default = {
    name                  = "eb_truckconnect",
    revision              = "1",
    display_name          = "eb_truckconnect",
    path                  = "truckconnect",
    protocols             = ["https"],
    service_protocol      = "https",
    subscription_required = true,
  }
}

##################################
# api operations
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation
##################################

variable "eb_truckconnect_api_operations" {
  default = [
    # eb_truckconnect CREATE
    {
      operation_id = "eb-truckconnect-create",
      description  = "eb-truckconnect create pass through",
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
    # eb_truckconnect READ
    {
      operation_id = "eb-truckconnect-read",
      description  = "eb-truckconnect read pass through",
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
    # eb_truckconnect UPDATE
    {
      operation_id = "eb-truckconnect-update",
      description  = "eb-truckconnect update pass through",
      display_name = "UPDATE",
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
    # eb_truckconnect DELETE
    {
      operation_id = "eb-truckconnect-delete",
      description  = "eb-truckconnect delete pass through",
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

// list of apis to add to the eb_truckconnect product.
variable "eb_truckconnect_product_apis" {
  default = [
    "eb_truckconnect",
  ]
}
