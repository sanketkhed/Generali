variable "sqs_name" {
  description = "Name of the SQS queue"
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}
