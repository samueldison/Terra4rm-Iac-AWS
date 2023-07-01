variable "region" {
    type = string
    description = "Region to deploy resources"
}

variable "db_table" {
    type = string
    description = "Name of Dynamodb table"
}

variable "bucket" {
    type = string
    description = "Name of S3 bucket"
}

variable "bucket_tag" {
  type = string
  description = "bucket tag"
}

variable "db_tag" {
  type = string
  description = "Tag for Dynamodb"
}
