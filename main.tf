resource "azurerm_app_service" "example" {
  name                       = var.name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.app_service_plan_id
  os_type                    = lower(var.os_type) == "linux" ? "linux" : null
  https_only = true

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
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = var.app_settings

  lifecycle {
    ignore_changes = [
      app_settings,
    ]
  }
  
  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }

  tags = var.tags
}