resource "aws_acm_certificate" "cert" {
  count                     = var.enabled ? 1 : 0
  domain_name               = var.hostname
  validation_method         = "DNS"
  subject_alternative_names = [var.wildcard_cert]
}

data "aws_route53_zone" "zone" {
  name         = var.zone_name
  private_zone = false
}

resource "aws_route53_record" "cert_validation" {
  count           = var.enabled ? length(aws_acm_certificate.cert.subject_alternative_names) + 1 : 0
  allow_overwrite = true
  zone_id         = data.aws_route53_zone.zone.zone_id
  name            = element(aws_acm_certificate.cert.domain_validation_options.*.resource_record_name, count.index)
  type            = element(aws_acm_certificate.cert.domain_validation_options.*.resource_record_type, count.index)
  records         = [element(aws_acm_certificate.cert.domain_validation_options.*.resource_record_value, count.index)]
  ttl             = 60
  depends_on      = [aws_acm_certificate.cert]
}

resource "aws_acm_certificate_validation" "cert" {
  count                   = var.enabled ? 1 : 0
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = aws_route53_record.cert_validation.*.fqdn
  depends_on              = [aws_acm_certificate.cert]
}
