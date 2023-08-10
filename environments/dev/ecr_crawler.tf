module "ecr_crawler" {
  source = "../../modules/ecr"

  project_name = local.ecs_name
}