module "maybeclean_bucket" {
  source = "./modules/s3"

  bucket_name = "maybeclean"
}