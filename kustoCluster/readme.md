https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_cluster

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

module "kusto_cluster" {
  source = "../../modules/kustoCluster"

  name                = "adx${var.naming_suffix}"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  sku = {
    name     = lookup(var.kusto_cluster.sku, "name", "Standard_L16as_v3")
    capacity = lookup(var.kusto_cluster.sku, "capacity", 12)
  }
  engine                    = lookup(var.kusto_cluster, "engine", "V2")
  allowed_fqdns             = lookup(var.kusto_cluster, "allowed_fqdns", [])
  allowed_ip_ranges         = lookup(var.kusto_cluster, "allowed_ip_ranges", [])
  double_encryption_enabled = lookup(var.kusto_cluster, "double_encryption_enabled", false)
  auto_stop_enabled         = lookup(var.kusto_cluster, "auto_stop_enabled", true)
  optimized_auto_scale = {
    minimum_instances = try(var.kusto_cluster.optimized_auto_scale.minimum_instances, 0)
    maximum_instances = try(var.kusto_cluster.optimized_auto_scale.maximum_instances, 20)
  }
  zones                              = lookup(var.kusto_cluster, "zones", ["1", "2", "3"])
  disk_encryption_enabled            = lookup(var.kusto_cluster, "disk_encryption_enabled", false)
  streaming_ingestion_enabled        = lookup(var.kusto_cluster, "streaming_ingestion_enabled", false)
  public_ip_type                     = lookup(var.kusto_cluster, "public_ip_type", "IPv4")
  public_network_access_enabled      = lookup(var.kusto_cluster, "public_network_access_enabled", true)
  outbound_network_access_restricted = lookup(var.kusto_cluster, "outbound_network_access_restricted", false)
  purge_enabled                      = lookup(var.kusto_cluster, "purge_enabled", false)
  virtual_network_configuration      = {}
  language_extensions                = lookup(var.kusto_cluster, "language_extensions", [])
  trusted_external_tenants           = lookup(var.kusto_cluster, "trusted_external_tenants", ["*"])
  diagnostics_name                   = "log-adx-${var.naming_suffix}"
  log_analytics_workspace_id         = data.terraform_remote_state.hub.outputs.spoke_monitors_log_workspace_uri[var.location]
  tags                               = merge(var.default_tags, var.resource_tags, var.env_tags, local.timestamp_tag)

  depends_on = [module.adx_namespace]
}
```


# variable file 
```
variable "kusto_cluster" {}

variable "naming_suffix" {}

```

# tfvars
```
naming_suffix = "telc-qa1-cus"

kusto_cluster = {
  sku = {
    name     = "Standard_L16as_v3"
    capacity = "5"
  }
  engine            = "V2"
  auto_stop_enabled = true
  optimized_auto_scale = {
    minimum_instances = 5
    maximum_instances = 20
  }
  zones = ["1", "2", "3"]
}
```