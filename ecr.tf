module "ecr_crawler" {
  source = "./modules/ecr"

  project_name = "${local.project_name}-${local.services[0]}"
}