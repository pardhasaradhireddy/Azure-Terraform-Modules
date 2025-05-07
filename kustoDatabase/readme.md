https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_database

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

module "kusto_database" {
  source = "../../modules/kustoDatabase"

  for_each = var.kusto_database

  name                = each.key
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  cluster_name        = module.kusto_cluster.cluster_name
  hot_cache_period    = lookup(each.value, "hot_cache_period", null)
  soft_delete_period  = lookup(each.value, "soft_delete_period", null)
}
```


# variable file 
```
variable "kusto_database" {}

variable "naming_suffix" {}

```

# tfvars
```
naming_suffix = "telc-qa1-cus"

kusto_database = {
  coba-ingress = {
    hot_cache_period   = "P30D"
    soft_delete_period = "P3650D"
  }
  Telematics = {
    hot_cache_period   = "P30D"
    soft_delete_period = "P3650D"
  }
  Logs = {
    hot_cache_period   = "P30D"
    soft_delete_period = "P3650D"
  }
  Security = {
    hot_cache_period   = "P30D"
    soft_delete_period = "P3650D"
  }
}
```