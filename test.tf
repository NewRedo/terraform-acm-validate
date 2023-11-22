module "google_cloud_dns" {
  source = "./google-cloud-dns"
  domain_validation_options = toset([{
    domain_name           = "example.com"
    resource_record_name  = "_acme-challenge.example.com"
    resource_record_type  = "TXT"
    resource_record_value = "example"
  }])
  dns_zone_name = "example-com"
}

module "aws_route53" {
  source = "./aws-route53"
  domain_validation_options = toset([{
    domain_name           = "example.com"
    resource_record_name  = "_acme-challenge.example.com"
    resource_record_type  = "TXT"
    resource_record_value = "example"
  }])
  dns_zone_name = "example.com"
}
