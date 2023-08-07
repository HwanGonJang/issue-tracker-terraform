# root -> server subdomain propagation

# A record for load balancer
resource "aws_route53_record" "record" {
  name    = var.backend_domain
  type    = "A"
  zone_id = var.route53_root_zone_id

  alias {
    evaluate_target_health = true
    name                   = aws_lb.ecs_alb.dns_name
    zone_id                = aws_lb.ecs_alb.zone_id
  }
}

resource "aws_route53_health_check" "backend_root" {
  fqdn              = var.backend_domain
  port              = 443
  type              = "HTTPS"
  resource_path     = "/"
  failure_threshold = "3"
  request_interval  = "30"

  tags = {
    Name = var.ecs_name
  }
}