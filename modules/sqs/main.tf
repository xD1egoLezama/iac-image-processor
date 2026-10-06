resource "aws_sqs_queue" "image_dlq" {
  name                      = "sqs-image-dlq-${var.environment}"
  message_retention_seconds = 1209600 # 14 dias

  tags = {
    Environment = var.environment
  }
}

resource "aws_sqs_queue" "image_queue" {
  name                       = "sqs-image-processing-${var.environment}"
  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 345600 # 4 dias
  receive_wait_time_seconds  = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.image_dlq.arn
    maxReceiveCount     = 5
  })

  tags = {
    Environment = var.environment
  }
}