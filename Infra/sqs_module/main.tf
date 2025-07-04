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
  count = var.enable_sqs ? 1 : 0
  name  = var.sqs_name
}
