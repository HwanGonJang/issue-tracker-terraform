module "ecs_cluster_crawler_dev" {
  source = "../../modules/ecs"

  ecs_name = "issue-tracker-crawler"
  service = "crawler"
  environment = "dev"
  backend_port = 8000
  region = "ap-northeast-2"
  vpc_id = data.aws_vpc.main.id
  public-subnet-ids = [data.aws_subnet.public_a.id, data.aws_subnet.public_c.id]
  private_cidr = local.crawler_dev_cidr_block
  nat-a-id = data.aws_nat_gateway.public_a.id
  nat-c-id = data.aws_nat_gateway.public_c.id
}