provider "aws" {
  region = "us-west-2"
}

module "ec2_module" {
  source          = "../../ec2_module"
  aws_region      = "us-west-2"
  ami_id          = "ami-0abcdef1234567890"
  instance_type   = "m5.large"
  instance_name   = "prod-ec2"
}

module "sns_module"{
  sns_topic_name  = "prod-sns-topic"
}

module "sqs_module"{
  sqs_name        = "prod-sqs-queue"
}

module "lambda_module" {
  source          = "../../lambda_module"
  function_name   = "prod-lambda"
  runtime         = "python3.9"
  handler         = "lambda_function.lambda_handler"
  lambda_package  = "lambda/dev_lambda.zip"
  sns_topic_arn   = module.ec2_sns_sms.sns_topic_arn
}
