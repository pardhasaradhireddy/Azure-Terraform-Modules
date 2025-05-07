## Route Table Module

### Source

- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table

### AzureRM Version

- This module uses azurerm version `3.114.0`. Ensure that your environment is compatible with this version to avoid issues.

### Tag version pointed in every deployment as of today (08-07-2024)

| Hub | Spoke | Spoke-EVHS | Spoke-Compute | Spoke-Post-Process |
| :---:   | :---: | :---: | :---: | :---: |
| v1.0.4 | v1.0.4 | NA | v1.0.4 | NA |

### Modifications made from the previous version of the tag

#### Added
- Added `disable_bgp_route_propagation`variable with a default value of `false`. 

#### Changed

#### Fixed

#### Removed