locals {
  project_name = "issue-tracker"
  prod     = var.environment == "prod"
  name_prefix = "${var.ecs_name}-${var.environment}"
}
