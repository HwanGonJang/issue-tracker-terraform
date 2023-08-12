module "ecr_crawler" {
  source = "../../modules/ecr"

  project_name = local.ecs_crawler_name
}

module "ecr_model" {
  source = "../../modules/ecr"

  project_name = local.ecs_model_name
}