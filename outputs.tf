output "web_app_default_hostname" {
  value = azurerm_linux_web_app.web_app.default_hostname
}
output "web_app_outbound_ip_addresses" {
  value = split(",", azurerm_linux_web_app.web_app.outbound_ip_addresses)
  # turn into a list
}
output "web_app_possible_outbound_ip_addresses" {
  value = split(",", azurerm_linux_web_app.web_app.possible_outbound_ip_addresses)
  # turn into a list
}
output "web_app_kind" {
  value = azurerm_linux_web_app.web_app.kind
}
output "web_app_id" {
  value = azurerm_linux_web_app.web_app.id
}
output "web_app_identity_principal_id" {
  value = length(azurerm_linux_web_app.web_app.identity) > 0 ? azurerm_linux_web_app.web_app.identity[0].principal_id : null
}