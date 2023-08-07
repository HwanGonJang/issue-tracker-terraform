resource "aws_security_group" "ecs_security_group" {
  name_prefix = "${var.ecs_name}-${var.environment}-ecs-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
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
