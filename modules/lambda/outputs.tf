output "function_arn" {
  description = "ARN de la funcion Lambda"
  value       = aws_lambda_function.image_processor.arn
}

output "function_name" {
  description = "Nombre de la funcion Lambda"
  value       = aws_lambda_function.image_processor.function_name
}