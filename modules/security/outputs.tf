output "lambda_security_group_id" {
  description = "ID del Security Group para la funcion Lambda"
  value       = aws_security_group.lambda_sg.id
}