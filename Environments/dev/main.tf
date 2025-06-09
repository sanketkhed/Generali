terraform {
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "us-east-1"
}

module "ec2_module" {
  source          = "../../ec2_module"
  aws_region      = "us-east-1"
  ami_id          = "ami-0abcdef1234567890"
  instance_type   = "t2.micro"
  instance_name   = "dev-ec2"
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
