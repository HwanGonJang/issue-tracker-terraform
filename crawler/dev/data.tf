data "aws_vpc" "main" {
  tags = { Name = local.vpc_name }
}

data "aws_internet_gateway" "main" {
  tags = { Name = local.internet_gateway_name }
}

data "aws_route_table" "public" {
  tags = { Name = local.route_table_name }
}

data "aws_nat_gateway" "public_a" {
  tags = { Name = local.nat_gateway_a_name }
}

data "aws_nat_gateway" "public_c" {
  tags = { Name = local.nat_gateway_c_name }
}

data "aws_subnet" "public_a" {
  tags = { Name = "${local.project_name}-subnet-public-a" }
}

data "aws_subnet" "public_c" {
  tags = { Name = "${local.project_name}-subnet-public-c" }
}