output "queue_id" {
  description = "URL de la cola SQS principal"
  value       = aws_sqs_queue.image_queue.id
}

output "queue_arn" {
  description = "ARN de la cola SQS principal"
  value       = aws_sqs_queue.image_queue.arn
}

output "dlq_arn" {
  description = "ARN de la cola SQS Dead Letter Queue"
  value       = aws_sqs_queue.image_dlq.arn
}