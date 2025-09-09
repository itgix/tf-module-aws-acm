The Terraform module is used by the ITGix AWS Landing Zone - https://itgix.com/itgix-landing-zone/

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_aws.shared_services"></a> [aws.shared\_services](#provider\_aws.shared\_services) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_route53_record.cert_validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Domain name to be assigned to main certificate, ex. itgix.com | `string` | n/a | yes |
| <a name="input_wildcard_cert"></a> [wildcard\_cert](#input\_wildcard\_cert) | SAN (subject alternative name) to be created in certificate, here we pass a domain with wildcard, ex. - *.itgix.com | `string` | n/a | yes |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | Domain name to match a R53 zone by | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cert_arn"></a> [cert\_arn](#output\_cert\_arn) | ARN of the certificate |
<!-- END_TF_DOCS -->
