#resource "aws_s3_bucket" "issue_tracker_bucket" {
#  bucket = "${local.project_name}-bucket"
#
#  ## 실수로 S3 버킷을 삭제하는 것을 방지
#  lifecycle {
#    prevent_destroy = true
#  }
#}
#
#resource "aws_s3_bucket_acl" "issue_tracker_bucket_acl" {
#  bucket = aws_s3_bucket.issue_tracker_bucket.id
#  acl    = "private"
#}
