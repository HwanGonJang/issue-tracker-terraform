locals {
  project_name = "issue-tracker"

  root_domain             = "yourssu-inviter.link"
  prod     = var.environment == "prod"
  name_prefix = "${var.ecs_name}-${var.environment}"
}
