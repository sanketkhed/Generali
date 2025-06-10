terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = var.aws_region
}

# Combine all tags dynamically
locals {
  dynamic_tags = merge(
    var.common_tags,
    {
      Name = var.instance_name
    },
    var.enable_sqs && length(aws_sqs_queue.queue1) > 0 ? {
      SQS_ARN_Tag = aws_sqs_queue.queue1[0].arn
    } : {},
    { for key, value in var.extra_tags : key => value }
  )
}

# EC2 instance using dynamic tags
resource "aws_instance" "instance1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags          = local.dynamic_tags
}



