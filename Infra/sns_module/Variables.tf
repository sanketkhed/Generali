variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}
variable "sns_topic_name" {
  description = "Name of the SNS topic"
  type        = string
}
variable "enable_sns" {
  description = "Whether to create an SNS topic"
  type        = bool
  default     = false
}
