resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket

  object_lock_enabled = true

  tags = {
    Name = var.bucket_tag
  }
}

resource "aws_s3_bucket_object_lock_configuration" "object-lock" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
}

resource "aws_s3_bucket_ownership_controls" "bucket-owner" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership =  "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.bucket-owner]
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

