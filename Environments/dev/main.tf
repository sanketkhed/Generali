terraform {
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "us-east-1"
}

locals {
  base_tags = merge(
    var.common_tags,
    {
      Name = var.instance_name
    },
    var.enable_sqs && length(aws_sqs_queue.queue1) > 0 ? {
      SQS_ARN = aws_sqs_queue.queue1[0].arn
    } : {},
    var.extra_tags
  )
}

module "ec2_module" {
  source = "./modules/ec2_instance"

  ami_id         = var.ami_id
  instance_type  = var.instance_type
  aws_region     = var.aws_region
  enable_sqs     = var.enable_sqs
  queue_name     = var.queue_name

  tags = local.base_tags
}

module "sns_module"{
   sns_topic_name  = "dev-sns-topic"
}

module "sqs_module"{
  sqs_name        = "dev-sqs-queue"
}

module "lambda_module" {
  source          = "../../lambda_module"
  function_name   = "dev-lambda"
  runtime         = "python3.9"
  handler         = "lambda_function.lambda_handler"
  lambda_package  = "lambda/dev_lambda.zip"
  sns_topic_arn   = module.ec2_sns_sms.sns_topic_arn
}
