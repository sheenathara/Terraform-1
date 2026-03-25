terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}


provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "ec2test1" {
  instance_type = var.instance_type
  ami           = "ami-0aa7d40eeae50c9a9"
#   subnet_id = aws_subnet.main.id
  tags = {
    name = "ec2test1"
    extra= var.extra
  }
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket_prefix = var.bucket_name
  tags = var.tags
}

resource "aws_s3_bucket_website_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
data "aws_subnets" "all" {
  # Optional filter by VPC
  filter {
     name   = "vpc-id"
     values = var.vpcid
   }
}

