resource "aws_dynamodb_table" "terraform-lock" {
  name           = var.db_table
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    "Name" = var.db_tag
  }
}