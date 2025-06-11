variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "enable_sqs" {
  description = "Whether to create the SQS queue"
  type        = bool
  default     = false
}

variable "queue_name" {
  description = "Name of the SQS queue"
  type        = string
}
