module "default_dns_crawler" {
  source = "./modules/dns"

  backend_domain              = "${local.services[0]}.${local.root_domain}"
  route53_root_domain_name = data.aws_route53_zone.root.name
  route53_root_zone_id = data.aws_route53_zone.root.zone_id
}

module "default_dns_model" {
  source = "./modules/dns"

  backend_domain              = "${local.services[1]}.${local.root_domain}"
  route53_root_domain_name = data.aws_route53_zone.root.name
  route53_root_zone_id = data.aws_route53_zone.root.zone_id
}

