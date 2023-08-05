resource "aws_lb" "ecs_alb" {
  name               = local.name_prefix
  internal           = false
  load_balancer_type = "application"
  subnets            = [data.aws_subnet.public_a.id, data.aws_subnet.public_c.id]

  tags = {
    Environment = local.name_prefix
  }
}

resource "aws_lb_target_group" "ecs_target_group" {
  name     = "${var.ecs_name}-tg"
  port     = 8000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"

  health_check {
    interval            = 30
    path                = "/"
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  tags = { Name = "${var.ecs_name}-target-group" }
}

resource "aws_lb_listener" "ecs_alb_listener" {
  load_balancer_arn = aws_lb.ecs_alb.arn
  port              = "80"
  protocol          = "HTTP"
  # ssl_policy        = "ELBSecurityPolicy-2016-08"
  # certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_target_group.arn
  }
}