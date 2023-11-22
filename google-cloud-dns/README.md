# Terraform ACM Certificate Validate Google DNS

This module creates the DNS records required to validate an ACM certificate using Google Cloud DNS.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | -------- |
| `domain_validation_options` | The domain validation options for the certificate | `set(`[`domain validation options`](#domain-validation-options)`)` |  | yes |
| `dns_zone_name` | The DNS zone name to create the validation records in | `string` |  | yes |

### Domain Validation Options

This object is the output from an `aws_acm_certficate`'s `domain_validation_options` attribute.

```hcl
{
  domain_name           = string
  resource_record_name  = string
  resource_record_type  = string
  resource_record_value = string
}
```

## Outputs

| Name | Description |
| ---- | ----------- |
| `validation_record_fqdns` | The DNS records created to validate the certificate.<br/>These records can be used to create a `aws_acm_certificate_validation` resource. |
