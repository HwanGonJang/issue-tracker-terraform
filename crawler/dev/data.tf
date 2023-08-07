### VPC
data "aws_vpc" "main" {
  tags = { Name = local.vpc_name }
}

data "aws_internet_gateway" "main" {
  tags = { Name = local.internet_gateway_name }
}

data "aws_route_table" "public" {
  tags = { Name = local.route_table_name }
}

#data "aws_nat_gateway" "public_a" {
#  tags = { Name = local.nat_gateway_a_name }
#}

data "aws_nat_gateway" "public_c" {
  tags = { Name = local.nat_gateway_c_name }
}

data "aws_subnet" "public_a" {
  tags = { Name = "${local.project_name}-subnet-public-a" }
}

data "aws_subnet" "public_c" {
  tags = { Name = "${local.project_name}-subnet-public-c" }
}

### Route53
data "aws_route53_zone" "root" {
  name = local.server_domain
}

data "aws_acm_certificate" "certificate" {
  domain   = "*.${local.server_domain}"
  statuses = ["ISSUED"]
}

### Iam Role
data "aws_iam_role" "ecs_task_execution_role" {
  name = "ecs_task_execution_role"
}

data "aws_iam_role" "ecs_task_role" {
  name = "ecs_task_role"
}

## ECS
#data "aws_ecs_cluster" "ecs_cluster" {
#  cluster_name = "${local.project_name}-${local.environment}"
#}

## ECR
data "aws_ecr_repository" "ecr_repository" {
  name = "${local.project_name}-${local.service}"
}