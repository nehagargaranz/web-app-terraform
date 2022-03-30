output "web_app_default_hostname" {
  value = azurerm_app_service.web_app.default_site_hostname
}
output "web_app_outbound_ip_addresses" {
  value = split(",", azurerm_app_service.web_app.outbound_ip_addresses)
  # turn into a list
}
output "web_app_possible_outbound_ip_addresses" {
  value = split(",", azurerm_app_service.web_app.possible_outbound_ip_addresses)
  # turn into a list
}
output "web_app_id" {
  value = azurerm_app_service.web_app.id
}
output "web_app_identity_principal_id" {
  value = length(azurerm_app_service.web_app.identity) > 0 ? azurerm_app_service.web_app.identity[0].principal_id : null
}