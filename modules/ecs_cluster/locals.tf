locals {
  prod     = var.environment == "prod"
  name_prefix = "${var.project}-${var.environment}"
}
