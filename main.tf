resource "azurerm_cdn_frontdoor_origin_group" "this" {
  name                     = var.name
  cdn_frontdoor_profile_id = var.cdn_frontdoor_profile_id
  session_affinity_enabled = var.session_affinity_enabled

  restore_traffic_time_to_healed_or_new_endpoint_in_minutes = var.restore_traffic_time_to_healed_or_new_endpoint_in_minutes

  health_probe {
    interval_in_seconds = var.health_probe_interval_in_seconds
    path                = var.health_probe_path
    protocol            = var.health_probe_protocol
    request_type        = var.health_probe_request_type
  }

  load_balancing {
    additional_latency_in_milliseconds = var.additional_latency_in_milliseconds
    sample_size                        = var.sample_size
    successful_samples_required        = var.successful_samples_required
  }
}

resource "azurerm_cdn_frontdoor_origin" "this" {
  for_each                      = var.origin_list != null ? { for origin in var.origin_list : origin.name => origin } : {}
  name                          = each.value.name
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.example.id
  enabled                       = each.value.enabled

  certificate_name_check_enabled = each.value.certificate_name_check_enabled
  host_name                      = each.value.host_name
  origin_host_header             = each.value.origin_host_header
  priority                       = each.value.priority
  weight                         = each.value.weight
}