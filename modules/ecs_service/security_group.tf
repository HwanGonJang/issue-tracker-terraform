resource "aws_security_group" "alb_security_group" {
  name_prefix = "${var.ecs_name}-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks      = ["0.0.0.0/0"] # var.private_cidr
  }

  tags = {
    Name = "${var.ecs_name}-elb"
  }
}

resource "aws_security_group" "ecs_security_group" {
  name_prefix = "${var.ecs_name}-ecs-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.backend_port
    to_port     = var.backend_port
    protocol    = "tcp"
    security_groups = [aws_security_group.alb_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks      = ["0.0.0.0/0"] # var.private_cidr
  }

  tags = {
    Name = "${var.ecs_name}-elb"
  }
}

