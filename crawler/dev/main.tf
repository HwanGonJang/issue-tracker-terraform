terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " ~> 4.0"
    }
  }

#  backend "s3" {
#    # Note that terraform doesn't support variable that can be applied to the terraform.backend.s3.*
#    bucket         = "issue-tracker-tf-state"
#    key            = "issue-tracker" # FIXME: 권장사항: smart-doctor-${local.project_name}
#    region         = "ap-northeast-2"
#    dynamodb_table = "smart-doctor-tf"
#    profile = "hwangonjang"
#  }
}

provider "aws" {
  region  = "ap-northeast-2"
  profile = "hwangonjang"
}