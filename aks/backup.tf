#--------
# Backup
#--------
resource "azurerm_data_protection_backup_vault" "backup_vault" {
  name                = var.backup.vault.name
  resource_group_name = var.resource_group_name
  location            = var.location
  datastore_type      = "VaultStore"
  redundancy          = var.backup.vault.redundancy
  soft_delete         = var.backup.vault.soft_delete
  identity {
    type = "SystemAssigned"
  }
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_kubernetes_cluster_extension" "backup" {
  name                             = "BackupVault"
  cluster_id                       = azurerm_kubernetes_cluster.k8s.id
  extension_type                   = "microsoft.dataprotection.kubernetes"
  release_train                    = lookup(var.backup.extension, "release_train", null)
  release_namespace                = lookup(var.backup.extension, "release_namespace", null)
  configuration_protected_settings = lookup(var.backup.extension, "configuration_protected_settings", null)
  configuration_settings           = lookup(var.backup.extension, "configuration_settings", null)
  target_namespace                 = lookup(var.backup.extension, "target_namespace", null)
  version                          = lookup(var.backup.extension, "version", null)
}

resource "azurerm_data_protection_backup_policy_kubernetes_cluster" "k8s" {
  name                            = "AKSBackupPolicy"
  resource_group_name             = var.resource_group_name
  vault_name                      = azurerm_data_protection_backup_vault.backup_vault.name
  backup_repeating_time_intervals = ["R/2024-05-23T02:30:00+00:00/P1D"]
  time_zone                       = "PST"
  default_retention_rule {
    life_cycle {
      duration        = "P7D"
      data_store_type = "OperationalStore"
    }
  }
}

resource "azurerm_data_protection_backup_instance_kubernetes_cluster" "backup_instance" {
  name                         = var.aks_cluster_name
  location                     = var.location
  vault_id                     = azurerm_data_protection_backup_vault.backup_vault.id
  kubernetes_cluster_id        = azurerm_kubernetes_cluster.k8s.id
  snapshot_resource_group_name = var.resource_group_name
  backup_policy_id             = azurerm_data_protection_backup_policy_kubernetes_cluster.k8s.id
  backup_datasource_parameters {
    excluded_namespaces              = []
    excluded_resource_types          = []
    cluster_scoped_resources_enabled = true
    included_namespaces              = []
    included_resource_types          = []
    label_selectors                  = []
    volume_snapshot_enabled          = true
  }
}

resource "azurerm_kubernetes_cluster_trusted_access_role_binding" "aks_cluster_trusted_access" {
  kubernetes_cluster_id = azurerm_kubernetes_cluster.k8s.id
  name                  = "backup-operator"
  roles                 = ["Microsoft.DataProtection/backupVaults/backup-operator"]
  source_resource_id    = azurerm_data_protection_backup_vault.backup_vault.id
}

resource "azurerm_role_assignment" "extension_and_storage_account_permission" {
  scope                = var.storage_account_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_kubernetes_cluster_extension.backup.aks_assigned_identity[0].principal_id
}

resource "azurerm_role_assignment" "vault_msi_read_on_cluster" {
  scope                = azurerm_kubernetes_cluster.k8s.id
  role_definition_name = "Reader"
  principal_id         = azurerm_data_protection_backup_vault.backup_vault.identity[0].principal_id
}

resource "azurerm_role_assignment" "vault_msi_read_on_snap_rg" {
  scope                = data.azurerm_resource_group.k8s.id
  role_definition_name = "Reader"
  principal_id         = azurerm_data_protection_backup_vault.backup_vault.identity[0].principal_id
}

resource "azurerm_role_assignment" "vault_msi_snapshot_contributor_on_snap_rg" {
  scope                = data.azurerm_resource_group.k8s.id
  role_definition_name = "Disk Snapshot Contributor"
  principal_id         = azurerm_data_protection_backup_vault.backup_vault.identity[0].principal_id
}

resource "azurerm_role_assignment" "vault_data_operator_on_snap_rg" {
  scope                = data.azurerm_resource_group.k8s.id
  role_definition_name = "Data Operator for Managed Disks"
  principal_id         = azurerm_data_protection_backup_vault.backup_vault.identity[0].principal_id
}