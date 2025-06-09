provider "aws" {
  region = "us-east-2"
}

module "ec2_module" {
  source          = "../../ec2_sns_sqs_module"
  aws_region      = "us-east-2"
  ami_id          = "ami-0abcdef1234567890"
  instance_type   = "t3.micro"
  instance_name   = "qa-ec2"
  
  
}

module "sns_module"{
  sns_topic_name  = "qa-sns-topic"
}

module "sqs_module"{
  sqs_name = "qa-sqs-queue"
}

module "lambda" {
  source          = "../../lambda_module"
  function_name   = "qa-lambda"
  runtime         = "python3.9"
  handler         = "lambda_function.lambda_handler"
  lambda_package  = "lambda/dev_lambda.zip"
  sns_topic_arn   = module.ec2_sns_sms.sns_topic_arn
}
