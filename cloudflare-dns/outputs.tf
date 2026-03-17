output "validation_record_fqdns" {
  value = [for record in cloudflare_dns_record.this : record.name]
}
