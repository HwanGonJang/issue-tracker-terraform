module "ecs_cluster_crawler_dev" {
  source = "../../modules/ecs"

  ecs_name = "issue-tracker-crawler"
  service = local.service
  environment = "dev"
  backend_port = local.backend_port
  region = "ap-northeast-2"
  vpc_id = data.aws_vpc.main.id
  public-subnet-ids = [data.aws_subnet.public_a.id, data.aws_subnet.public_c.id]
  private_cidr = local.crawler_dev_cidr_block
  nat-a-id = data.aws_nat_gateway.public_c.id
  nat-c-id = data.aws_nat_gateway.public_c.id
  backend_domain = local.backend_domain
  route53_root_zone_id = data.aws_route53_zone.root.zone_id
  route53_root_domain_name = data.aws_route53_zone.root.name
}