provider "aws" {
  region = "us-east-2"
}

module "ec2_sns_sqs_module" {
  source          = "../../ec2_sns_sms_module"
  aws_region      = "us-east-2"
  ami_id          = "ami-0abcdef1234567890"
  instance_type   = "t3.micro"
  instance_name   = "qa-ec2"
  sns_topic_name  = "qa-sns-topic"
  sqs_name        = "qa-sqs-queue"
}
