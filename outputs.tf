output "origin_group_id" {
    description = "Front Door Origin Group Id"
    value = azurerm_cdn_frontdoor_origin_group.this.id
}