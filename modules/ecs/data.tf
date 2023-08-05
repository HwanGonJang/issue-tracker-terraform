data "aws_iam_role" "ecs_task_execution_role" {
  name = "ecs_task_execution_role"
}

data "aws_iam_role" "ecs_task_role" {
  name = "ecs_task_role"
}

data "aws_subnet" "public_a" {
  tags = { Name = "${local.project_name}-subnet-public-a" }
}

data "aws_subnet" "public_c" {
  tags = { Name = "${local.project_name}-subnet-public-c" }
}

data "aws_ecr_repository" "ecr_repository" {
  name = var.ecs_name
}