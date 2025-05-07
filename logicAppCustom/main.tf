#--------------------
# Logic App Workflow
#--------------------
resource "azurerm_logic_app_workflow" "logic_app_workflow" {
  name                = var.logic_app_workflow_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
  /* lifecycle {
    ignore_changes = [
      tags,
    ]
  } */
}

#--------------------------
# Logic App Trigger Custom
#--------------------------
resource "azurerm_logic_app_trigger_custom" "logic_app_trigger_custom" {
  name         = var.logic_app_trigger_custom_name
  logic_app_id = azurerm_logic_app_workflow.logic_app_workflow.id

  body = <<BODY
{
  "recurrence": {
    "frequency": "Day",
    "interval": 1
  },
  "type": "Recurrence"
}
BODY

}