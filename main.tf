resource "azurerm_linux_web_app" "web_app" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.app_service_plan_id
  https_only          = true

  dynamic "identity" {
    for_each = local.identity_type=="SystemAssigned" ? [1] : []
    content {
      type = local.identity_type
    }
  }

  dynamic "identity" {
    for_each = local.identity_type=="SystemAssigned, UserAssigned" || local.identity_type=="UserAssigned" ? [1] : []
    content {
      type = local.identity_type
      identity_ids = var.user_assigned_managed_ids
    }
  }

  site_config {
    always_on     = var.always_on
    http2_enabled = var.http2_enabled
    ftps_state    = "FtpsOnly"

    cors {
      allowed_origins     = contains(keys(var.cors), "allowed_origins") ? var.cors.allowed_origins : []
      support_credentials = contains(keys(var.cors), "support_credentials") ? var.cors.support_credentials : false
    }

    application_stack {
      dotnet_version   = contains(keys(var.application_stack), "docker_version") ? var.cors.docker_version : ""
      docker_image     = var.application_stack.docker_image
      docker_image_tag = var.application_stack.docker_image_tag
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