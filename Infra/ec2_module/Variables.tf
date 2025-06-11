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

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "add_sqs_tag" {
  description = "Whether to add SQS_ARN_Tag"
  type        = bool
  default     = true
}

variable "common_tags" {
  description = "Common base tags applied to all resources"
  type        = map(string)
  default     = {
    ManagedBy   = "terraform"
  }
}

variable "extra_tags" {
  description = "Extra dynamic tags"
  type        = map(string)
  default     = {
    Module = "ec2"
  }
}

variable "sqs_name" {
  description = "Name of the SQS queue"
  type        = string
}


variable "enable_sqs" {
  description = "Whether to create the SQS queue"
  type        = bool
  default     = false
}

