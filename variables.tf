variable "name" {
    description = "The name which should be used for this Front Door Origin Group. Changing this forces a new Front Door Origin Group to be created."
    type = string
}

variable "cdn_frontdoor_profile_id" {
    description= "The ID of the Front Door Profile within which this Front Door Origin Group should exist. Changing this forces a new Front Door Origin Group to be created."
    type = string
}

variable "restore_traffic_time_to_healed_or_new_endpoint_in_minutes" {
    description = "Specifies the amount of time which should elapse before shifting traffic to another endpoint when a healthy endpoint becomes unhealthy or a new endpoint is added"
    type = number
    default = 10
    validation {
        condition     = restore_traffic_time_to_healed_or_new_endpoint_in_minutes >= 0 && restore_traffic_time_to_healed_or_new_endpoint_in_minutes <= 50
        error_message = "Invalid variable: ${var.restore_traffic_time_to_healed_or_new_endpoint_in_minutes}. Allowed range is 0-50."
    }
}

variable "session_affinity_enabled" {
    description = "Specifies whether session affinity should be enabled on this host."
    type = bool
    default = true
}


variable "additional_latency_in_milliseconds" {
    description = "Specifies the additional latency in milliseconds for probes to fall into the lowest latency bucket. Possible values are between 0 and 1000 seconds (inclusive)"
    type = number
    default = 50
    validation {
        condition     = additional_latency_in_milliseconds > 0 && additional_latency_in_milliseconds < 1000
        error_message = "Invalid variable: ${var.additional_latency_in_milliseconds}. Allowed range is 0-1000."
    }
}

variable "sample_size" {
    description = "Specifies the number of samples to consider for load balancing decisions."
    type = number
    default = 4
    validation {
        condition     = sample_size > 0 && sample_size < 255
        error_message = "Invalid variable: ${var.sample_size}. Allowed range is 0-255."
    }
}

variable "successful_samples_required" {
    description = "Specifies the number of samples within the sample period that must succeed."
    type = number
    default = 3
    validation {
        condition     = sample_size > 0 && sample_size < 255
        error_message = "Invalid variable: ${var.sample_size}. Allowed range is 0-255."
    }
}

variable "health_probe_interval_in_seconds" {
    description = "Specifies the number of seconds between health probes. Possible values are between 5 and 31536000 seconds (inclusive)."
    type = number
    default = 30
    validation {
        condition     = health_probe_interval_in_seconds > 5 && health_probe_interval_in_seconds < 31536000
        error_message = "Invalid variable: ${var.sample_size}. Allowed range is 5-31536000."
    }

}
variable "health_probe_path" {
    description = "Specifies the path relative to the origin that is used to determine the health of the origin. Defaults to /."
    type = string
    default = "/"

}
variable "health_probe_protocol" {
    description = "Specifies the protocol to use for health probe." 
    type = string
    default = "Https"
    validation {
        condition = var.health_probe_protocol == "Http" || var.health_probe_protocol == "Https"
        error_message = "Invalid variable: ${var.health_probe_protocol}. Allowed values is HTTP HTTPs"
    }
}

variable "health_probe_request_type" {
    description = "Specifies the type of health probe request that is made. Possible values are GET and HEAD. Defaults to HEAD."
    type = string
    default = "HEAD"
    validation {
        condition = var.health_probe_request_type == "GET" || var.health_probe_request_type == "HEAD"
        error_message = "Invalid variable: ${var.health_probe_request_typel}. Allowed values GET HEAD"
    }
}