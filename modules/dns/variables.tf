variable "backend_domain" {
    type = string
    description = "The domain name of the backend"
}

variable "route53_root_zone_id" {
  type        = string
  description = "Route53 root zone id"
}

variable "route53_root_domain_name" {
  type        = string
  description = "Route53 root domain name"
}