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

# Pass tags directly into the resource
resource "aws_instance" "instance1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags          = var.tags
}

resource "aws_sqs_queue" "queue1" {
  count = var.enable_sqs ? 1 : 0
  name  = var.queue_name
}
