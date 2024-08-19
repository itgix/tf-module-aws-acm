resource "aws_acm_certificate" "cert" {
  domain_name               = var.hostname
  validation_method         = "DNS"
  subject_alternative_names = [var.wildcard_cert]
}

data "aws_route53_zone" "zone" {
  name         = var.zone_name
  private_zone = false

  provider = aws.shared_services # DNS zone is in the shared services account
}

resource "aws_route53_record" "cert_validation" {
  count = length(aws_acm_certificate.cert.subject_alternative_names) + 1

  provider = aws.shared_services # DNS zone is in the shared services account

  allow_overwrite = true
  zone_id         = data.aws_route53_zone.zone.zone_id
  name            = element(aws_acm_certificate.cert.domain_validation_options.*.resource_record_name, count.index)
  type            = element(aws_acm_certificate.cert.domain_validation_options.*.resource_record_type, count.index)
  records         = [element(aws_acm_certificate.cert.domain_validation_options.*.resource_record_value, count.index)]
  ttl             = 60
  depends_on      = [aws_acm_certificate.cert]
}

resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = aws_route53_record.cert_validation.*.fqdn
  depends_on              = [aws_acm_certificate.cert]
}
