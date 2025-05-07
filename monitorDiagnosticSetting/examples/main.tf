#----------------
# Resource Group
#----------------
resource "azurerm_resource_group" "resource_group" {
  name     = "rg-diag-sp-dev-cus-01"
  location = "centralus"
  tags = {
    team_number = "team09"
    team_name   = "platform"
    source      = "manual"
    deployment  = "manual"
    environment = "dev"
    reason      = "DTNATELE-66700"
    owner       = "bmangun"
  }
}

#-----------------
# Storage Account
#-----------------
resource "azurerm_storage_account" "storage_account" {
  name                     = "stacdiagspdevcus01"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = azurerm_resource_group.resource_group.tags
}

#-----------
# Key Vault
#-----------
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                       = "kvdiagspdevcus01"
  location                   = azurerm_resource_group.resource_group.location
  resource_group_name        = azurerm_resource_group.resource_group.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 7
  purge_protection_enabled   = false
  sku_name                   = "standard"
  tags                       = azurerm_resource_group.resource_group.tags
}

#----------------------------
# Monitor Diagnostic Setting
#----------------------------
module "monitor_diagnostic_setting" {
  source                         = "../"
  name                           = "diag-kv"
  target_resource_id             = azurerm_key_vault.key_vault.id
  eventhub_name                  = null
  eventhub_authorization_rule_id = null

  enabled_log = {
    category = {
      category       = "AuditEvent"
      category_group = null
    }
    # category_group = {
    #   category       = null
    #   category_group = "audit"
    # }
  }

  metric = {
    AllMetrics = {
      category = "AllMetrics"
      enabled  = true
    }
  }

  storage_account_id = azurerm_storage_account.storage_account.id
}