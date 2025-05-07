terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}


resource "azurerm_resource_group" "netwatcher_rg" {
  for_each = var.location
  name     = "${var.rg_name}${var.pod}-${lower(var.environment)}-${each.key}"
  location = each.value

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_network_watcher" "netwatcher" {
  for_each            = var.location
  name                = "${var.network_watcher_name}${var.pod}-${lower(var.environment)}-${each.key}"
  resource_group_name = azurerm_resource_group.netwatcher_rg[each.key].name
  location            = azurerm_resource_group.netwatcher_rg[each.key].location

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_storage_account" "storage" {
  for_each            = var.location
  name                = replace("${var.storage_name}${var.pod}-${lower(var.environment)}-${each.key}", "-", "")
  resource_group_name = azurerm_resource_group.netwatcher_rg[each.key].name
  location            = azurerm_resource_group.netwatcher_rg[each.key].location

  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_log_analytics_workspace" "log_workspace" {
  for_each            = var.location
  name                = "${var.log_name}${var.pod}-${lower(var.environment)}-${each.key}"
  resource_group_name = azurerm_resource_group.netwatcher_rg[each.key].name
  location            = azurerm_resource_group.netwatcher_rg[each.key].location
  sku                 = "PerGB2018"

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_application_insights" "application_insights" {
  for_each            = var.location
  name                = "${var.application_insights_name}${var.pod}-${lower(var.environment)}-${each.key}"
  location            = azurerm_resource_group.netwatcher_rg[each.key].location
  resource_group_name = azurerm_resource_group.netwatcher_rg[each.key].name
  application_type    = "other"

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}
