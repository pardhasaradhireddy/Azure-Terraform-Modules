#------------------
# ServiceBus Queue
#------------------
module "servicebus_queue" {
  source = "../serviceBusQueue"

  for_each              = toset(var.queues)
  servicebus_queue_name = each.key
  servicebus_id         = azurerm_servicebus_namespace.servicebus_ns.id
  lock_duration         = "PT5M"
  key_vault_id          = var.key_vault_id
  tags                  = var.tags
}