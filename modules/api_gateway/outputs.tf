output "api_url" {
  description = "URL base de invocacion para el API Gateway"
  value       = aws_api_gateway_stage.stage.invoke_url
}