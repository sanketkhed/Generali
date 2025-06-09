output "ec2_instance_id" {
  value = aws_instance.instance1.id
}

output "sns_topic_arn" {
  value = aws_sns_topic.topic1.arn
}

output "sqs_queue_arn" {
  value = aws_sqs_queue.queue1.arn
}
