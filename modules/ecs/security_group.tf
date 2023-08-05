resource "aws_security_group" "ecs_security_group" {
  name_prefix = "${var.ecs_name}-${var.environment}-ecs-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.private_cidr
  }

  tags = {
    Name = "${local.name_prefix}-elb"
  }
}
