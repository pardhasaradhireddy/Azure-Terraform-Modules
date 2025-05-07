# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation

resource "azurerm_api_management_api_operation" "prometheus_api_operations" {
  count = length(var.prometheus_api_operations)

  operation_id        = var.prometheus_api_operations[count.index].operation_id
  api_management_name = var.apim_name
  resource_group_name = var.apim_resource_group_name
  api_name            = azurerm_api_management_api.prometheus_api.name
  description         = var.prometheus_api_operations[count.index].description
  display_name        = var.prometheus_api_operations[count.index].display_name
  method              = var.prometheus_api_operations[count.index].method
  url_template        = var.prometheus_api_operations[count.index].url_template

  dynamic "response" {
    for_each = var.prometheus_api_operations[count.index].responses
    content {
      status_code = response.value["status_code"]
      description = response.value["description"]
    }
  }
}