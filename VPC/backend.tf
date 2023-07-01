# Backend Block-S3 & DynamoDB
terraform {
  backend "s3" {
    bucket         = "webprojekt-remote-state"
    key            = "webprojekt/VPC/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    
  }
}
