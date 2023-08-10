module "ecs_service_crawler_dev" {
  source = "../../modules/ecs_service"

  ecs_name    = local.ecs_name
  service     = local.service
  environment = local.environment

  backend_domain = local.backend_domain
  backend_port   = local.backend_port

  region = local.region

  vpc_id            = data.aws_vpc.main.id
  public-subnet-ids = [data.aws_subnet.public_a.id, data.aws_subnet.public_c.id]
  private_cidr      = local.crawler_dev_cidr_block
  nat-a-id          = data.aws_nat_gateway.public_c.id
  nat-c-id          = data.aws_nat_gateway.public_c.id

  route53_root_domain_name = data.aws_route53_zone.root.name
  route53_root_zone_id     = data.aws_route53_zone.root.zone_id
  acm_certificate_arn      = data.aws_acm_certificate.certificate.arn

  ecs_task_role_arn           = data.aws_iam_role.ecs_task_role.arn
  ecs_task_execution_role_arn = data.aws_iam_role.ecs_task_execution_role.arn
  ecs_cluster_name            = "${local.project_name}-${local.environment}"
  ecr_repository_url          = data.aws_ecr_repository.ecr_repository.repository_url
  ecs_service_cpu             = 1024
  ecs_service_memory          = 3072
}