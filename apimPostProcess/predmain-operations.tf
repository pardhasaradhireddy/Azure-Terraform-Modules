# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation

resource "azurerm_api_management_api_operation" "predmain_api_operations" {
  count = length(var.predmain_api_operations)

  api_management_name = var.apim_name
  resource_group_name = var.apim_resource_group_name
  api_name            = azurerm_api_management_api.predmain_api.name
  description         = var.predmain_api_operations[count.index].description
  display_name        = var.predmain_api_operations[count.index].display_name
  method              = var.predmain_api_operations[count.index].method
  operation_id        = var.predmain_api_operations[count.index].operation_id
  url_template        = var.predmain_api_operations[count.index].url_template

  request {
    description = var.predmain_api_operations[count.index].request.description

    dynamic "header" {
      for_each = var.predmain_api_operations[count.index].request.headers
      content {
        name          = header.value["name"]
        required      = header.value["required"]
        type          = header.value["type"]
        description   = header.value["description"]
        default_value = header.value["default_value"]
        values        = header.value["values"]
      }
    }

    dynamic "query_parameter" {
      for_each = var.predmain_api_operations[count.index].request.query_parameters
      content {
        name          = query_parameter.value["name"]
        required      = query_parameter.value["required"]
        type          = query_parameter.value["type"]
        description   = query_parameter.value["description"]
        default_value = query_parameter.value["default_value"]
        values        = query_parameter.value["values"]
      }
    }
  }

  dynamic "response" {
    for_each = var.predmain_api_operations[count.index].responses
    content {
      status_code = response.value["status_code"]
      description = response.value["description"]
    }
  }

  dynamic "template_parameter" {
    for_each = var.predmain_api_operations[count.index].template_parameters
    content {
      name        = template_parameter.value["name"]
      required    = template_parameter.value["required"]
      type        = template_parameter.value["type"]
      description = template_parameter.value["description"]
    }
  }
}
