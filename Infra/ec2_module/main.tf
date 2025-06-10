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

resource "aws_instance" "instance1" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = merge(
    {
      Name = var.instance_name
    },
    var.common_tags,
    var.enable_sqs ? {
      SQS_ARN_Tag = aws_sqs_queue.queue1[0].arn
    } : {},
    { for key, value in var.extra_tags : key => value }
  )
}



