data "cloudflare_zone" "this" {
  filter = {
    name = var.dns_zone_name
  }
}

resource "cloudflare_dns_record" "this" {
  for_each = {
    for dvo in var.domain_validation_options : dvo.domain_name => {
      name   = trimsuffix(dvo.resource_record_name, ".")
      record = trimsuffix(dvo.resource_record_value, ".")
      type   = dvo.resource_record_type
    }
  }
  name    = each.value.name
  type    = each.value.type
  content = each.value.record
  ttl     = 1
  zone_id = data.cloudflare_zone.this.id
}
