output "api_endpoint" {
  description = "URL base del API Gateway en produccion"
  value       = module.api_gateway.api_url
}

output "s3_bucket_name" {
  description = "Nombre del bucket S3 en produccion"
  value       = module.s3.bucket_name
}