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

variable "os_type" {
  description = "OS Type (Optional)."
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
  type        = map
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
  description = "Should the Web App be loaded at all times? Defaults to false"
  type        = bool
  default     = false
}

variable "http2_enabled" {
  description = "Specifies whether or not the http2 protocol should be enabled. Defaults to false."
  type        = bool
  default     = false
}

variable "container_registry_use_managed_identity" {
  description = "Should connections for Azure Container Registry use Managed Identity (Optional)"
  type        = bool
  default     = false
}

variable "docker_image" {
  description = "The Docker image reference, including repository host as needed. (Optional)"
  type        = string
  default     = null
}

variable "docker_image_tag" {
  description = "The image Tag to use. (Optional)"
  type        = string
  default     = null
}

variable "dotnet_version" {
  description = "The version of .Net to use. Possible values include 3.1, 5.0, and 6.0 (Optional)" 
  type        = string
  default     = null
}

variable "java_server" {
  description = "The java server type. Possible values include JAVA, TOMCAT, and JBOSSEAP. (Optional)"
  type        = string
  default     = null
}

variable "java_server_version" {
  description = "The Version of the java_server to use. (Optional)"
  type        = string
  default     = null
}

variable "java_version" {
  description = "The Version of Java to use. (Optional)" 
  type        = string
  default     = null
}

variable "php_version" {
  description = "The version of PHP to run. Possible values include 7.4, and 8.0 (Optional)" 
  type        = string
  default     = null
}

variable "node_version" {
  description = "The version of Node to run. Possible values include 12-lts, 14-lts, and 16-lts. (Optional)"
  type        = string
  default     = null
}

variable "python_version" {
  description = "The version of Python to run. Possible values include 3.7, 3.8, and 3.9. (Optional)"
  type        = string
  default     = null
}

variable "ruby_version" {
  description = "The version of Ruby to run. Possible values include 2.6 and 2.7. (Optional)" 
  type        = string
  default     = null
}