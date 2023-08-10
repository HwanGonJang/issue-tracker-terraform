module "ecs_cluster_dev" {
  source = "../../modules/ecs_cluster"

  project     = local.project_name
  environment = local.environment
}