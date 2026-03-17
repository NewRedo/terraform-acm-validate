variable "domain_validation_options" {
  type = set(object({
    domain_name           = string
    resource_record_name  = string
    resource_record_type  = string
    resource_record_value = string
  }))
}

variable "dns_zone_name" {
  type        = string
  description = "Name of DNS zone to create records in"
}
