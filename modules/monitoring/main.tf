# Log Group para la función Lambda
resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = 14

  tags = {
    Environment = var.environment
  }
}

# Alarma de CloudWatch para Errores en Lambda
resource "aws_cloudwatch_metric_alarm" "lambda_errors" {
  alarm_name          = "lambda-errors-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = 300
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Alarma cuando la Lambda de procesamiento falla"

  dimensions = {
    FunctionName = var.lambda_function_name
  }

  tags = {
    Environment = var.environment
  }
}

# Alarma de CloudWatch para Mensajes en Dead Letter Queue (DLQ)
resource "aws_cloudwatch_metric_alarm" "sqs_dlq_messages" {
  alarm_name          = "sqs-dlq-messages-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "ApproximateNumberOfMessagesVisible"
  namespace           = "AWS/SQS"
  period              = 300
  statistic           = "Sum"
  threshold           = 0
  alarm_description   = "Alarma cuando hay mensajes en la DLQ de SQS"

  dimensions = {
    QueueName = var.sqs_dlq_name
  }

  tags = {
    Environment = var.environment
  }
}