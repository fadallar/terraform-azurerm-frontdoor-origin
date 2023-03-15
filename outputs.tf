output "origin_group_id" {
  description = "Front Door Origin Group Id"
  value       = azurerm_cdn_frontdoor_origin_group.this.id
}

output "origin_id_list" {
  description = "List of FrontDoor Origin Ids"
  value       = { for origin in azurerm_cdn_frontdoor_origin.this : "origin" => origin.id... }
}