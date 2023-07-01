resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket

  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }
  tags = {
    Name = var.bucket_tag
  }
}
