data "google_dns_managed_zone" "this" {
  name = var.dns_zone_name
}

/* Loop over each domain validation option and create a DNS record for it */
resource "google_dns_record_set" "this" {
  for_each = {
    for dvo in var.domain_validation_options : dvo.domain_name => {
      name  = dvo.resource_record_name
      type  = dvo.resource_record_type
      value = dvo.resource_record_value
    }
  }
  name         = each.value.name
  type         = each.value.type
  ttl          = 300
  managed_zone = data.google_dns_managed_zone.this.name
  rrdatas      = [each.value.value]
}
