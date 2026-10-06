output "lambda_role_arn" {
  description = "ARN del rol IAM para las funciones Lambda"
  value       = aws_iam_role.lambda_exec.arn
}