resource "aws_s3_bucket" "logs_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.logs_bucket.id

  rule {
    id     = "log-cleanup"
    status = "Enabled"

    expiration {
      days = 7
    }

    filter {
      prefix = "app/logs/"
    }
  }
}