### ECR
resource "aws_ecr_repository" "ecr_crawler" {
  name         = var.project_name
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = { Name = var.project_name }
}

resource "aws_ecr_repository_policy" "ecs_crawler_policy" {
  repository = aws_ecr_repository.ecr_crawler.name

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "ecrPolicy",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",
                "ecr:DescribeRepositories",
                "ecr:GetRepositoryPolicy",
                "ecr:ListImages",
                "ecr:DeleteRepository",
                "ecr:BatchDeleteImage",
                "ecr:SetRepositoryPolicy",
                "ecr:DeleteRepositoryPolicy"
            ]
        }
    ]
}
EOF
}

resource "aws_ecr_lifecycle_policy" "delete_untagged_all_image" {
  repository = aws_ecr_repository.ecr_crawler.name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Delete Untagged All Images",
            "selection": {
                "tagStatus": "untagged",
                "countType": "imageCountMoreThan",
                "countNumber": 1
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}