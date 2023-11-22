terraform-acm-validate
======================

This is a set of terraform modules to validate an ACM certificate using various DNS providers.

It provides a consistent interface for creating the DNS records required to validate an ACM 
certificate.

Refer to each module's README for more information.

## Modules

* [AWS Route53](aws-route53/README.md)
* [Google Cloud DNS](google-cloud-dns/README.md)

## Usage

To use in your project, declare an instance of the module in your terraform code and use the 
`validation_record_fqdns` in a `aws_acm_certificate_validation` object.

```hcl
module "validation" {
  source = "git@github.com:NewRedo/terraform-acm-validate.git//aws-route53?ref=v2.0.0"
  domain_validation_options = aws_acm_certificate.example.domain_validation_options
  dns_zone_name = "example.com"
}

resource "aws_acm_certificate_validation" "example" {
  certificate_arn         = aws_acm_certificate.example.arn
  validation_record_fqdns = module.validation.validation_record_fqdns
}
```

