resource "aws_ecs_cluster" "ecs_cluster" {
  name = local.name_prefix

  tags = { Name: "${local.name_prefix}-cluster" }
}