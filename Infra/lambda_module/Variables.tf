variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "runtime" {
  description = "Runtime for Lambda (e.g., python3.9)"
  type        = string
  default     = "python3.9"
}

variable "handler" {
  description = "Handler function (e.g., lambda_function.lambda_handler)"
  type        = string
}

variable "lambda_package" {
  description = "Path to the Lambda deployment package (ZIP file)"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNS Topic ARN to pass as an environment variable"
  type        = string
}
