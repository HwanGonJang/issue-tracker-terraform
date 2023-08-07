### Route 53 server record
resource "aws_route53_zone" "server_api" {
  name = var.backend_domain
}

# root -> server subdomain propagation
resource "aws_route53_record" "server_api" {
  name    = aws_route53_zone.server_api.name
  type    = "NS"
  zone_id = var.route53_root_zone_id
  ttl     = 172800
  records = aws_route53_zone.server_api.name_servers
}