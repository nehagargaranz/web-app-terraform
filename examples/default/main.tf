module "web_app" {
  source                     = "../.."
  name                       = random_string.name.result
  location                   = random_shuffle.location.result[0]
  resource_group_name        = azurerm_resource_group.example.name
  app_service_plan_id        = azurerm_app_service_plan.example.id
  system_assigned_managed_id = true
  app_settings               = {}
  linux_fx_version           = "DOTNETCORE|3.1"

  tags = local.tags
}

resource "azurerm_resource_group" "example" {
  name     = random_string.resource_group_name.result
  location = random_shuffle.location.result[0]

  tags = local.tags
}

resource "azurerm_app_service_plan" "example" {
  name                = random_string.app_service_plan_id.result
  location            = random_shuffle.location.result[0]
  resource_group_name = azurerm_resource_group.example.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }

  tags = local.tags
}

resource "random_string" "name" {
  length  = 24
  special = false
  upper   = false
  lower   = true
}

resource "random_shuffle" "location" {
  input        = ["Australia East"]
  result_count = 1
}

resource "random_string" "resource_group_name" {
  length  = 24
  special = false
}

resource "random_string" "app_service_plan_id" {
  length  = 24
  special = false
}