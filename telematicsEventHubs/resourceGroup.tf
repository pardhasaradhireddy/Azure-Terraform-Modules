resource "azurerm_resource_group" "telematics_eventhubs_rg" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}
