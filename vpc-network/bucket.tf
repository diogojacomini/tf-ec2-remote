resource "aws_s3_bucket_versioning" "versioning_bucket" {
  bucket = "bucket-tfstate-jac"
  versioning_configuration {
    status = "Enabled"
  }
}
