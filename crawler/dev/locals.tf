locals {
  # Environment
  environment = "dev"

  # Project Variables
  project_name        = "issue-tracker"
  service = "crawler"
  ecs_name = "${local.project_name}-${local.service}-${local.environment}"

  # Domain name
  root_domain             = "yourssu-inviter.link"
  server_domain           = "crawler.${local.root_domain}"
  backend_domain          = "${local.environment}.crawler.${local.root_domain}"
  backend_port            = 8000

  # Main VPC
  vpc_name              = "${local.project_name}-vpc"
  internet_gateway_name = "${local.project_name}-internet-gateway"
  route_table_name      = "${local.project_name}-route-table"
  nat_gateway_a_name    = "${local.project_name}-nat-gateway-a"
  nat_gateway_c_name    = "${local.project_name}-nat-gateway-c"


  crawler_dev_cidr_block = ["10.0.4.0/24", "10.0.5.0/24", ]

  # AWS base configuration
  region              = "ap-northeast-2"
  availability_zone_a = "${local.region}a"
  availability_zone_c = "${local.region}c"

  # Health check
  load_balancer_health_check_path = "/"
}
