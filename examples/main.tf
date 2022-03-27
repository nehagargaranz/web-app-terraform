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