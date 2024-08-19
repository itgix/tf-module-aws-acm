variable "wildcard_cert" {
  type        = string
  description = "SAN (subject alternative name) to be created in certificate, here we pass a domain with wildcard, ex. - *.itgix.com"
}

variable "zone_name" {
  type        = string
  description = "Domain name to match a R53 zone by"
}

variable "hostname" {
  type        = string
  description = "Domain name to be assigned to main certificate, ex. itgix.com"
}
