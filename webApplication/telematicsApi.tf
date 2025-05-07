resource "azurerm_resource_group" "dcp_windows_app_service_resource_group" {
  name     = var.dcp_windows_app_service_rg_name
  location = var.location

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_app_service_plan" "dcp_windows_app_service_plan" {
  name                = var.dcp_windows_app_service_plan_name
  location            = azurerm_resource_group.dcp_windows_app_service_resource_group.location
  resource_group_name = azurerm_resource_group.dcp_windows_app_service_resource_group.name

  sku {
    tier = var.dcp_app_service_plan_sku_tier
    size = var.dcp_app_service_plan_sku_size
  }

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_management_lock" "dcp_windows_app_service_plan_management_lock" {
  name       = "dcp_windows_app_service_plan_management_lock"
  scope      = azurerm_app_service_plan.dcp_windows_app_service_plan.id
  lock_level = "CanNotDelete"
  notes      = "Locked to prevent deletion - static ip preservation"
}

resource "azurerm_app_service" "dcp_web_api" {
  name                = var.dcp_api_app_service_name
  location            = azurerm_resource_group.dcp_windows_app_service_resource_group.location
  resource_group_name = azurerm_resource_group.dcp_windows_app_service_resource_group.name
  app_service_plan_id = azurerm_app_service_plan.dcp_windows_app_service_plan.id
  https_only          = true

  site_config {
    dotnet_framework_version = var.dcp_app_dotnet_framework_version
  }

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"                  = azurerm_application_insights.dcp_web_api.instrumentation_key
    "APPINSIGHTS_PROFILEFEATURE_VERSION"              = var.dcp_api_app_insights_profile_feature_version
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"             = var.dcp_api_app_insights_snapshot_feature_version
    "APPLICATIONINSIGHTS_CONNECTION_STRING"           = azurerm_application_insights.dcp_web_api.connection_string
    "ApplicationInsightsAgent_EXTENSION_VERSION"      = var.dcp_api_app_insights_agent_extension_version
    "DiagnosticServices_EXTENSION_VERSION"            = var.dcp_api_app_insights_diagnostic_services_extension_version
    "InstrumentationEngine_EXTENSION_VERSION"         = var.dcp_api_app_insights_instrumentation_engine_extension_version
    "SnapshotDebugger_EXTENSION_VERSION"              = var.dcp_api_app_insights_snapshot_debugger_extension_version
    "XDT_MicrosoftApplicationInsights_BaseExtensions" = var.dcp_api_app_insights_xdt_base_extensions
    "XDT_MicrosoftApplicationInsights_Mode"           = var.dcp_api_app_insights_xdt_mode
    "XDT_MicrosoftApplicationInsights_PreemptSdk"     = var.dcp_api_app_insights_xdt_preempt_sdk
  }

  lifecycle {
    ignore_changes = [
      app_settings,
      site_config,
      tags["CreatedDate"],
    ]
  }

  tags = var.tags
}

resource "azurerm_management_lock" "dcp_web_api_management_lock" {
  name       = "dcp_web_api_management_lock"
  scope      = azurerm_app_service.dcp_web_api.id
  lock_level = "CanNotDelete"
  notes      = "Locked to prevent deletion - static ip preservation"
}

resource "azurerm_app_service_virtual_network_swift_connection" "dcp_web_api_swift_connection" {
  app_service_id = azurerm_app_service.dcp_web_api.id
  subnet_id      = var.snet_dcportal_id
}

resource "azurerm_management_lock" "dcp_web_api_swift_connection_management_lock" {
  name       = "dcp_web_api_swift_connection_management_lock"
  scope      = azurerm_app_service_virtual_network_swift_connection.dcp_web_api_swift_connection.id
  lock_level = "CanNotDelete"
  notes      = "Locked to prevent deletion - static ip preservation"
}

resource "azurerm_role_assignment" "apim_admins" {
  role_definition_name = "Managed Application Contributor Role"
  principal_id         = var.webapp_admin_security_group_id
  scope                = azurerm_app_service.dcp_web_api.id
}


