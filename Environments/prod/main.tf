provider "aws" {
  region = "us-west-2"
}

module "ec2_module" {
  source          = "../../ec2_sns_sqs_module"
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
