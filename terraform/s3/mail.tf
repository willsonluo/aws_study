provider "aws" {
    region = "ap-east-1"
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "${var.demo_name}-log"
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket" "b" {
  bucket =  "${var.demo_name}-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/"
  }

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id      = "log"
    enabled = true

    prefix = "log/"

    tags = {
      rule      = "log"
      autoclean = "true"
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA" # or "ONEZONE_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

    expiration {
      days = 90
    }
  }
}

