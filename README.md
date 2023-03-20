# Azure Front Door Origin Group and Origin 

This Terraform module creates an Azure FrontDor Origin Group and add adds origin to it 

The Azure Front Door Profile is not created by this module and should be provided as an input parameter 

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_cdn_frontdoor_origin.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_origin) | resource |
| [azurerm_cdn_frontdoor_origin_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_origin_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cdn_frontdoor_profile_id"></a> [cdn\_frontdoor\_profile\_id](#input\_cdn\_frontdoor\_profile\_id) | The ID of the Front Door Profile within which this Front Door Origin Group should exist. Changing this forces a new Front Door Origin Group to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name which should be used for this Front Door Origin Group. Changing this forces a new Front Door Origin Group to be created. | `string` | n/a | yes |
| <a name="input_additional_latency_in_milliseconds"></a> [additional\_latency\_in\_milliseconds](#input\_additional\_latency\_in\_milliseconds) | Specifies the additional latency in milliseconds for probes to fall into the lowest latency bucket. Possible values are between 0 and 1000 seconds (inclusive) | `number` | `50` | no |
| <a name="input_health_probe_interval_in_seconds"></a> [health\_probe\_interval\_in\_seconds](#input\_health\_probe\_interval\_in\_seconds) | Specifies the number of seconds between health probes. Possible values are between 5 and 31536000 seconds (inclusive). | `number` | `30` | no |
| <a name="input_health_probe_path"></a> [health\_probe\_path](#input\_health\_probe\_path) | Specifies the path relative to the origin that is used to determine the health of the origin. Defaults to /. | `string` | `"/"` | no |
| <a name="input_health_probe_protocol"></a> [health\_probe\_protocol](#input\_health\_probe\_protocol) | Specifies the protocol to use for health probe. | `string` | `"Https"` | no |
| <a name="input_health_probe_request_type"></a> [health\_probe\_request\_type](#input\_health\_probe\_request\_type) | Specifies the type of health probe request that is made. Possible values are GET and HEAD. Defaults to HEAD. | `string` | `"HEAD"` | no |
| <a name="input_origin_list"></a> [origin\_list](#input\_origin\_list) | n/a | <pre>list(object({<br>    name                           = string<br>    host_name                      = string<br>    enabled                        = bool<br>    certificate_name_check_enabled = bool<br>    origin_host_header             = string<br>    priority                       = number<br>    weight                         = number<br>  }))</pre> | `[]` | no |
| <a name="input_restore_traffic_time_to_healed_or_new_endpoint_in_minutes"></a> [restore\_traffic\_time\_to\_healed\_or\_new\_endpoint\_in\_minutes](#input\_restore\_traffic\_time\_to\_healed\_or\_new\_endpoint\_in\_minutes) | Specifies the amount of time which should elapse before shifting traffic to another endpoint when a healthy endpoint becomes unhealthy or a new endpoint is added | `number` | `10` | no |
| <a name="input_sample_size"></a> [sample\_size](#input\_sample\_size) | Specifies the number of samples to consider for load balancing decisions. | `number` | `4` | no |
| <a name="input_session_affinity_enabled"></a> [session\_affinity\_enabled](#input\_session\_affinity\_enabled) | Specifies whether session affinity should be enabled on this host. | `bool` | `true` | no |
| <a name="input_successful_samples_required"></a> [successful\_samples\_required](#input\_successful\_samples\_required) | Specifies the number of samples within the sample period that must succeed. | `number` | `3` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_origin_group_id"></a> [origin\_group\_id](#output\_origin\_group\_id) | Front Door Origin Group Id |
| <a name="output_origin_id_list"></a> [origin\_id\_list](#output\_origin\_id\_list) | List of FrontDoor Origin Ids |
<!-- END_TF_DOCS -->
## Related documentation
