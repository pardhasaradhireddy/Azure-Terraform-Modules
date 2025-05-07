# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation

resource "azurerm_api_management_api_operation" "pushgateway_api_operations" {
  count = var.enable_prometheus_pushgateway ? length(var.pushgateway_api_operations) : 0

  operation_id        = var.pushgateway_api_operations[count.index].operation_id
  api_management_name = var.apim_name
  resource_group_name = var.apim_resource_group_name
  api_name            = azurerm_api_management_api.pushgateway_api[0].name
  description         = var.pushgateway_api_operations[count.index].description
  display_name        = var.pushgateway_api_operations[count.index].display_name
  method              = var.pushgateway_api_operations[count.index].method
  url_template        = var.pushgateway_api_operations[count.index].url_template

  dynamic "response" {
    for_each = var.pushgateway_api_operations[count.index].responses
    content {
      status_code = response.value["status_code"]
      description = response.value["description"]
    }
  }
}
