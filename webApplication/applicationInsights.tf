resource "azurerm_application_insights" "dcp_web_api" {
  name                = var.dcp_api_app_service_name
  location            = var.location
  resource_group_name = azurerm_resource_group.dcp_windows_app_service_resource_group.name
  application_type    = var.dcp_web_api_application_insights_type

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_application_insights" "dcp_web_app" {
  name                = var.dcp_portal_app_service_name
  location            = var.location
  resource_group_name = azurerm_resource_group.dcp_windows_app_service_resource_group.name
  application_type    = var.dcp_web_api_application_insights_type

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_application_insights" "dcp_mfe_host_web_app" {
  name                = var.dcp_portal_mfe_host_app_service_name
  location            = var.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  application_type    = var.dcp_web_api_application_insights_type

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_application_insights" "dcp_mfe_client_vehicle_maintenance_web_app" {
  name                = var.dcp_portal_mfe_client_vehicle_maintenance_app_service_name
  location            = var.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  application_type    = var.dcp_web_api_application_insights_type

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_application_insights" "dcp_mfe_client_notifications_web_app" {
  name                = var.dcp_portal_mfe_client_notifications_app_service_name
  location            = var.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  application_type    = var.dcp_web_api_application_insights_type

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_application_insights" "dcp_mfe_client_navbar_web_app" {
  name                = var.dcp_portal_mfe_client_navbar_app_service_name
  location            = var.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  application_type    = var.dcp_web_api_application_insights_type

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_application_insights" "dcp_mfe_legacy_web_app" {
  name                = var.dcp_portal_mfe_legacy_app_service_name
  location            = var.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  application_type    = var.dcp_web_api_application_insights_type

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_application_insights" "dcp_mfe_static_web_app" {
  name                = var.dcp_portal_mfe_static_app_service_name
  location            = var.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  application_type    = var.dcp_web_api_application_insights_type

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_application_insights" "dcp_mfe_client_geofence_web_app" {
  name                = var.dcp_portal_mfe_client_geofence_app_service_name
  location            = var.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  application_type    = var.dcp_web_api_application_insights_type

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_application_insights" "dcp_mfe_client_service_center_web_app" {
  name                = var.dcp_portal_mfe_client_service_center_app_service_name
  location            = var.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  application_type    = var.dcp_web_api_application_insights_type

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_application_insights" "dcp_mfe_vhealth_index_web_app" {
  name                = var.dcp_portal_mfe_vhealth_index_app_service_name
  location            = var.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  application_type    = var.dcp_web_api_application_insights_type

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}