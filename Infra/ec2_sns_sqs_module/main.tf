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

resource "aws_sqs_queue" "queue1" {
  name = var.sqs_name
}

resource "aws_instance" "instance1" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name        = var.instance_name
    SQS_ARN_Tag = aws_sqs_queue.queue1.arn
  }
}

resource "aws_sns_topic" "topic1" {
  name = var.sns_topic_name
}
