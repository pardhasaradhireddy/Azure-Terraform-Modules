This module includes the deployment of all necessary ExpressRoute resources, makes API calls to the MegaPort provider to exchange 
a service-key for provisioning an ExpressRoute circuit, and establish Private Peering to Daimler's internal networks.

Current State:  MegaPort API services are not available at this time so the resources for BGP Peering and Virtual Network Gateway connection are commented
out.  You cannot establish Private Peering or the VNG -> ER Circuit connection without the circuit being in a provisioned state.

The following resources are created in this deployment:

    - ExpressRoute Circuit
    - ExpressRoute Virtual Network Gateway
    - Public IP for ExpressRoute Virtual Network Gateway
    - Private Peering / BGP Peering Connection (commented out at this time)
    - Connection from Virtual Nework Gateway and ExpressRoute Circuit (commented out at this time)
    - Connection to Diagnostics Event Hub
    - Resource Locks

Future State:  This module will be in a partial-state until which time MegaPort services are available for automatic provisioning.  Once consumable 
the service-key for provisioning the ER circuit will be programmatically sent to MegaPort.  This process takes approximately 1-2 minutes before the circuit 
is in a provisioned state.  Once the circuit is in a provisioned state, the BGP Private Peering has to be established and then the ExpressRoute Virtual Network 
Gateway connection can then be provisioned, in that order.

Prior to Updating this Module or Consuming ExpressRoute Resources, Please Refer to:

https://gsep.daimler.com/confluence/display/DTNATELE/Telematics+2.0+README+Reference+Document

Official Microsoft Documentation for ExpressRoute:

https://docs.microsoft.com/en-us/azure/expressroute/expressroute-introduction

Terraform Resources for ExpressRoute Circuit:

https://www.terraform.io/docs/providers/azurerm/r/express_route_circuit.html

### Backup of azurerm_express_route_circuit_peering (Commented code)

```HCL
resource "azurerm_express_route_circuit_peering" "er_peering" {
  peering_type                  = var.peering_type
  express_route_circuit_name    = var.expressroute_circuit_name
  resource_group_name           = var.expressroute_resource_group_name
  peer_asn                      = 65505
  primary_peer_address_prefix   = "170.2.224.48/30"
  secondary_peer_address_prefix = "170.2.224.52/30"
  vlan_id                       = 703
}
```