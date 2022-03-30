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

variable "app_service_plan_id" {
  description = "App Service Plan ID."
  type        = string
}

variable "system_assigned_managed_id" {
  description = "Do we generate a system assigned managed identity for this web app? (Optional)"
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
  type        = map(any)
  default     = {}
}

variable "cors" {
  description = "Cors settings for Web App (Optional)."
  default = {
    allowed_origins     = []
    support_credentials = false
  }
}

variable "always_on" {
  description = "Should the Web App be loaded at all times? Defaults to false. (Optional)"
  type        = bool
  default     = false
}

variable "http2_enabled" {
  description = "Specifies whether or not the http2 protocol should be enabled. Defaults to false. (Optional)"
  type        = bool
  default     = false
}

variable "linux_fx_version" {
  description = " Linux App Framework and version for the App Service.(Optional)"
  type        = string
  default     = null
}

variable "windows_fx_version" {
  description = "The Windows Docker container image. (Optional)"
  type        = string
  default     = null
}

variable "acr_use_managed_identity_credentials" {
  description = "Should connections for Azure Container Registry use Managed Identity (Optional)"
  type        = bool
  default     = false
}

variable "health_check_path" {
  description = "The health check path to be pinged by App Service. (Optional)"
  type        = string
  default     = ""
}