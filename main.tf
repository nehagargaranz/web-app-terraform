resource "azurerm_linux_web_app" "web_app" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.app_service_plan_id
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
    always_on     = var.always_on
    http2_enabled = var.http2_enabled
    ftps_state    = "FtpsOnly"

    container_registry_use_managed_identity = var.container_registry_use_managed_identity

    cors {
      allowed_origins     = contains(keys(var.cors), "allowed_origins") ? var.cors.allowed_origins : []
      support_credentials = contains(keys(var.cors), "support_credentials") ? var.cors.support_credentials : false
    }

    application_stack {
      docker_image     = var.docker_image
      docker_image_tag = var.docker_image_tag
      dotnet_version   = var.dotnet_version

      java_server         = var.java_server
      java_server_version = var.java_server_version
      java_version        = var.java_version

      php_version    = var.php_version
      node_version   = var.node_version
      python_version = var.python_version
      ruby_version   = var.ruby_version
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