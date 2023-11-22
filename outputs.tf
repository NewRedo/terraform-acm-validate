output "validation_record_fqdns" {
  value = [for record in google_dns_record_set.this : record.name]
}
