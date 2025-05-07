#-------------------
# Network Interface
#-------------------
resource "azurerm_network_interface" "network_interface" {
  name                = "nic-${var.windows_virtual_machine_name}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig-${var.windows_virtual_machine_name}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    private_ip_address            = var.private_ip_address_allocation == "Static" ? var.private_ip_address : null
  }

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}

#--------------------------
# Windows Virtual Machines
#--------------------------
resource "azurerm_windows_virtual_machine" "windows_virtual_machine" {
  name                = var.windows_virtual_machine_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.network_interface.id,
  ]
  provision_vm_agent         = var.provision_vm_agent
  allow_extension_operations = var.allow_extension_operations

  dynamic "identity" {
    for_each = length(var.managed_identity) == 0 ? {} : var.managed_identity
    content {
      type         = "UserAssigned"
      identity_ids = [var.managed_identity.id]
    }
  }

  os_disk {
    name                 = "osdisk-${var.windows_virtual_machine_name}"
    caching              = var.os_disk.caching
    storage_account_type = var.os_disk.storage_account_type
    disk_size_gb         = var.os_disk.disk_size_gb
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}