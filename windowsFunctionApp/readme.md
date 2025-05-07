# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/function_app

# Azurerm Provider configuration
```

provider "azurerm" {
  features {}
}

# Version
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.36.0"
    }
  }
}
```

# Deployment file

```

module "windows_function_app" {
  source = "../../modules/windowsFunctionApp"

  name                       = "app-adx-${var.naming_suffix}"
  resource_group_name        = module.resource_group.name
  location                   = module.resource_group.location
  service_plan_id            = module.service_plan.id
  daily_memory_time_quota    = lookup(var.windows_function_app, "daily_memory_time_quota", null)
  enabled                    = lookup(var.windows_function_app, "enabled", null)
  enable_builtin_logging     = lookup(var.windows_function_app, "enable_builtin_logging", true)
  https_only                 = lookup(var.windows_function_app, "https_only", true)
  os_type                    = lookup(var.windows_function_app, "os_type", "")
  app_settings               = merge(local.user_app_settings, local.app_settings)
  connection_string          = lookup(var.windows_function_app, "connection_string", {})
  site_config                = merge(local.user_site_config, local.site_config)
  source_control             = lookup(var.windows_function_app, "source_control", {})
  auth_settings              = lookup(var.windows_function_app, "auth_settings", {})
  app_version                = lookup(var.windows_function_app, "version", "~4")
  storage_account_access_key = module.storage_account.primary_access_key
  storage_account_name       = module.storage_account.name
  tags                       = merge(var.default_tags, var.resource_tags, var.env_tags, local.timestamp_tag)
}
```


# variable file 
```
variable "naming_suffix" {}

```

# tfvars
```
naming_suffix = "telc-qa1-cus"

windows_function_app = {
  https_only = true
  site_config = {
    always_on           = false
    ftps_state          = "AllAllowed"
    minimum_tls_version = "1.2"
    application_stack = {
      dotnet_version = "6"
    }
  }
  app_settings = {
    eventHubNameIncoming              = "itc-prd20-env-eh-dtnaprd-telemetry-wus"
    eventHubNameIncomingConsumerGroup = "ingress2"
    eventHubNameOutgoing              = "evh-coba-ingress-telc-qa1-cus"
    FUNCTIONS_EXTENSION_VERSION       = "~4"
    FUNCTIONS_WORKER_RUNTIME          = "dotnet"
    WEBSITE_CONTENTSHARE              = "app-adx-manual-telc-qa1-cus8e87"
  }
  connection_string = [
    {
      name  = "incomingeh:clientId"
      value = "@Microsoft.KeyVault(SecretUri=https://kv-adx-telc-qa1-cus.vault.azure.net/secrets/spClientId/)"
      type  = "Custom"
    },
    {
      name  = "incomingeh:clientSecret"
      value = "@Microsoft.KeyVault(SecretUri=https://kv-adx-telc-qa1-cus.vault.azure.net/secrets/spClientSecret/)"
      type  = "Custom"
    },
    {
      name  = "incomingeh:fullyQualifiedNamespace"
      value = "@Microsoft.KeyVault(SecretUri=https://kv-adx-telc-qa1-cus.vault.azure.net/secrets/incomingfullyQualifiedNamespace/)"
      type  = "Custom"
    },
    {
      name  = "incomingeh:tenantId"
      value = "@Microsoft.KeyVault(SecretUri=https://kv-adx-telc-qa1-cus.vault.azure.net/secrets/spTenantId/)"
      type  = "Custom"
    },
    {
      name  = "outgoingeh:fullyQualifiedNamespace"
      value = "@Microsoft.KeyVault(SecretUri=https://kv-adx-telc-qa1-cus.vault.azure.net/secrets/outgoingfullyQualifiedNamespace/)"
      type  = "Custom"
    }
  ]
  version = "~4"
  enabled = true
}
```