data "aws_route53_zone" "root" {
  name = local.root_domain
}

data "aws_route53_zone" "crawl" {
  name = "${local.services[0]}.${local.root_domain}"
}