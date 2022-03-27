variable "name" {
  description = "Name of the App Service Plan."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group to create the App Service Plan in."
  type        = string
}

variable "tags" {
  description = "Map of tags to apply to resource"
  type        = map(string)
}

variable "location" {
  description = "Location to create the App Service Plan in, if different from the resource group location (Optional)."
  type        = string
  default     = ""
}

variable "subnet_id" {
  description = "Subnet ID for Regional VNet Integration (Optional)."
  type        = string
  default     = ""
}

variable "os_type" {
  description = "OS Type (Optional)."
  type        = string
  default     = ""
}

variable "app_service_plan_id" {
  description = "Application Service Plan ID."
  type        = string
}

variable "system_assigned_managed_id" {
  description = "Do we generate a system assigned managed identity for this function app? (Optional)"
  type        = bool
  default     = false
}

variable "user_assigned_managed_ids" {
  description = "Specifies a list of user managed identity ids to be assigned (Optional)"
  type        = list(string)
  default     = []
}

variable "app_settings" {
  description = "A map of key-value pairs for App Settings and custom values. (Optional)"
  type        = map
  default     = {}
}