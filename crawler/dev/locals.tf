locals {
  project_name        = "issue-tracker" # FIXME

  # Domain name
  root_domain             = "yourssu-inviter.link"
  frontend_domain         = "reservation.${local.root_domain}" # FIXME / SSR
  frontend_port           = 3000
  backend_domain          = "api.${local.frontend_domain}" # FIXME
  backend_port            = 5000

  # Main VPC
  vpc_name              = "${local.project_name}-vpc"
  internet_gateway_name = "${local.project_name}-internet-gateway"
  route_table_name      = "${local.project_name}-route-table"
  nat_gateway_a_name    = "${local.project_name}-nat-gateway-a"
  nat_gateway_c_name    = "${local.project_name}-nat-gateway-c"

  # CIDR blocks # FIXME
  # Refer to README at https://github.com/AlmSmartDoctor/smart-doctor-common-terraform
  # Use block in 10.0.144.0/20, 10.0.160.0/20
  vpc_cidr_block       = "10.0.0.0/16"
  public_a_cidr_block                    = "10.0.0.0/24"
  public_c_cidr_block                    = "10.0.1.0/24"

  crawler_dev_cidr_block = ["10.0.4.0/24", "10.0.5.0/24", ]

  # AWS base configuration
  region              = "ap-northeast-2"
  availability_zone_a = "${local.region}a"
  availability_zone_c = "${local.region}c"

  # Health check
  load_balancer_health_check_path = "/"
}
