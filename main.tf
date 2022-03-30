resource "azurerm_app_service" "web_app" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id
  https_only          = true

  dynamic "identity" {
    for_each = local.identity_type == "SystemAssigned" ? [1] : []
    content {
      type = local.identity_type
    }
  }

  dynamic "identity" {
    for_each = local.identity_type == "SystemAssigned, UserAssigned" || local.identity_type == "UserAssigned" ? [1] : []
    content {
      type         = local.identity_type
      identity_ids = var.user_assigned_managed_ids
    }
  }

  site_config {
    always_on                            = var.always_on
    http2_enabled                        = var.http2_enabled
    ftps_state                           = "FtpsOnly"
    linux_fx_version                     = var.linux_fx_version
    windows_fx_version                   = var.windows_fx_version
    health_check_path                    = var.health_check_path
    acr_use_managed_identity_credentials = var.acr_use_managed_identity_credentials

    cors {
      allowed_origins     = contains(keys(var.cors), "allowed_origins") ? var.cors.allowed_origins : []
      support_credentials = contains(keys(var.cors), "support_credentials") ? var.cors.support_credentials : false
    }
  }

  app_settings = var.app_settings

  lifecycle {
    ignore_changes = [
      app_settings,
    ]
  }

  tags = var.tags
}