output "bucket_id" {
  description = "ID / Nombre del bucket S3 de imagenes"
  value       = aws_s3_bucket.images.id
}

output "bucket_name" {
  description = "Nombre del bucket S3 de imagenes"
  value       = aws_s3_bucket.images.id
}

output "bucket_arn" {
  description = "ARN del bucket S3 de imagenes"
  value       = aws_s3_bucket.images.arn
}