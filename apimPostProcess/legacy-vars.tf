##################################
# api
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api
##################################

variable "legacy_api" {
  default = {
    name                  = "legacy",
    revision              = "1",
    display_name          = "legacy",
    path                  = "legacy",
    protocols             = ["https"],
    service_protocol      = "https",
    subscription_required = true,
  }
}

##################################
# api operations
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation
##################################

variable "legacy_api_operations" {
  default = [
    # legacy CREATE
    {
      operation_id = "legacy-create",
      description  = "legacy create pass through",
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
    # legacy READ
    {
      operation_id = "legacy-read",
      description  = "legacy read pass through",
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
    # legacy UPDATE
    {
      operation_id = "legacy-update",
      description  = "legacy update pass through",
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
    # legacy DELETE
    {
      operation_id = "legacy-delete",
      description  = "legacy delete pass through",
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

// list of apis to add to the legacy product.
variable "legacy_product_apis" {
  default = [
    "legacy",
  ]
}
