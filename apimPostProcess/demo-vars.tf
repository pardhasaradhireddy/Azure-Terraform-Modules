##################################
# api
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api
##################################

variable "demo_api" {
  default = {
    name                  = "demo",
    revision              = "1",
    display_name          = "demo",
    path                  = "demo",
    protocols             = ["https"],
    service_path          = "demo/v1",
    service_protocol      = "https",
    subscription_required = true,
    version               = "v1",
  }
}

##################################
# api version set
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_version_set
##################################

variable "demo_api_version_set" {
  default = {
    name              = "demo-version-set",
    display_name      = "demo",
    versioning_scheme = "Segment"
  }
}

##################################
# api operations
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation
##################################

variable "demo_api_operations" {
  default = [
    # demo CREATE
    {
      description  = "demo CREATE",
      display_name = "CREATE",
      method       = "POST",
      operation_id = "demo-create",
      url_template = "/"
      request = {
        description      = "CREATE a demo.",
        headers          = [],
        query_parameters = [],
      },
      responses = [
        {
          status_code = 204,
          description = "no content"
        },
        {
          status_code = 400,
          description = "bad request"
        },
        {
          status_code = 500,
          description = "internal server error",
        },
      ],
      template_parameters = [],
    },
    # demo READ w/ RowKey
    {
      operation_id = "demo-read-with-rowkey",
      description  = "demo READ with RowKey",
      display_name = "READ w/ Row Key",
      method       = "GET",
      url_template = "/{rowKey}"
      request = {
        description      = "READ a demo with primary key.",
        headers          = [],
        query_parameters = [],
        representations  = [],
      },
      responses = [
        {
          status_code = 200,
          description = "success",
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
      template_parameters = [
        {
          name        = "rowKey",
          required    = true,
          type        = "String",
          description = "primary key",
        },
      ],
    },
    # demo READ w/ Tan
    {
      operation_id = "demo-read-with-tan",
      description  = "demo READ with Tan",
      display_name = "READ w/ Tan",
      method       = "GET",
      url_template = "/"
      request = {
        description = "READ all demos with Telematics Account Number (TAN).",
        headers     = [],
        query_parameters = [
          {
            name          = "tan",
            required      = true,
            type          = "String",
            description   = "Telematics Account Number",
            default_value = "",
            values        = null,
          }
        ],
        representations = [],
      },
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
          status_code = 500,
          description = "internal server error",
        },
      ],
      template_parameters = [],
    },
    # demo UPDATE
    {
      operation_id = "demo-update",
      description  = "demo UPDATE",
      display_name = "UPDATE",
      method       = "PUT",
      url_template = "/"
      request = {
        description      = "UPDATE a demo.",
        headers          = [],
        query_parameters = [],
        representations  = [],
      },
      responses = [
        {
          status_code = 204,
          description = "no content"
        },
        {
          status_code = 400,
          description = "bad request"
        },
        {
          status_code = 500,
          description = "internal server error",
        },
      ],
      template_parameters = [],
    },
    # demo DELETE w/ RowKey
    {
      operation_id = "demo-delete-with-rowkey",
      description  = "demo DELETE with RowKey",
      display_name = "DELETE w/ Row Key",
      method       = "DELETE",
      url_template = "/{rowKey}"
      request = {
        description      = "DELETE a demo with primary key.",
        headers          = [],
        query_parameters = [],
        representations  = [],
      },
      responses = [
        {
          status_code = 204,
          description = "no content"
        },
        {
          status_code = 500,
          description = "internal server error",
        },
      ],
      template_parameters = [
        {
          name        = "rowKey",
          required    = true,
          type        = "String",
          description = "primary key",
        },
      ],
    },
  ]
}
