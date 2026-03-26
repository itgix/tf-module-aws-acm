The Terraform module is used by the ITGix AWS Landing Zone - https://itgix.com/itgix-landing-zone/

# AWS ACM Terraform Module

This module creates an AWS Certificate Manager (ACM) certificate with DNS validation using Route 53.

Part of the [ITGix AWS Landing Zone](https://itgix.com/itgix-landing-zone/).

## Resources Created

- ACM certificate with SAN (Subject Alternative Name)
- Route 53 DNS validation records

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `wildcard_cert` | SAN (subject alternative name) to be created in certificate, e.g. `*.itgix.com` | `string` | — | yes |
| `zone_name` | Domain name to match a R53 zone by | `string` | — | yes |
| `hostname` | Domain name to be assigned to main certificate, e.g. `itgix.com` | `string` | — | yes |

## Outputs

| Name | Description |
|------|-------------|
| `cert_arn` | ARN of the certificate |

## Usage Example

```hcl
module "acm" {
  source = "path/to/tf-module-aws-acm"

  hostname      = "example.com"
  wildcard_cert = "*.example.com"
  zone_name     = "example.com"
}
```
