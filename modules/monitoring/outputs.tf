output "log_group_arn" {
  description = "ARN del grupo de logs en CloudWatch"
  value       = aws_cloudwatch_log_group.lambda_logs.arn
}

output "lambda_alarm_arn" {
  description = "ARN de la alarma de errores de Lambda"
  value       = aws_cloudwatch_metric_alarm.lambda_errors.arn
}