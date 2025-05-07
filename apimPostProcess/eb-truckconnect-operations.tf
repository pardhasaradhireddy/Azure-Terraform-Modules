# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation

resource "azurerm_api_management_api_operation" "eb_truckconnect_api_operations" {
  count = length(var.eb_truckconnect_api_operations)

  operation_id        = var.eb_truckconnect_api_operations[count.index].operation_id
  api_management_name = var.apim_name
  resource_group_name = var.apim_resource_group_name
  api_name            = azurerm_api_management_api.eb_truckconnect_api.name
  description         = var.eb_truckconnect_api_operations[count.index].description
  display_name        = var.eb_truckconnect_api_operations[count.index].display_name
  method              = var.eb_truckconnect_api_operations[count.index].method
  url_template        = var.eb_truckconnect_api_operations[count.index].url_template

  dynamic "response" {
    for_each = var.eb_truckconnect_api_operations[count.index].responses
    content {
      status_code = response.value["status_code"]
      description = response.value["description"]
    }
  }
}
