variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
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

variable "enable_sqs" {
  description = "Whether to create the SQS queue"
  type        = bool
  default     = false
}
