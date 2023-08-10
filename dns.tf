module "default_dns_crawler" {
  source = "./modules/dns"

  backend_domain              = "${local.services[0]}.${local.root_domain}"
  route53_root_domain_name    = data.aws_route53_zone.root.name
  route53_root_zone_id        = data.aws_route53_zone.root.zone_id
  route53_service_domain_name = data.aws_route53_zone.crawl.name
  route53_service_zone_id     = data.aws_route53_zone.crawl.zone_id
}

