data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/../../lambda/index.py"
  output_path = "${path.module}/lambda_function.zip"
}

# Crear la Funcion Lambda
resource "aws_lambda_function" "image_processor" {
  filename         = data.archive_file.lambda_zip.output_path
  function_name    = "lambda-image-processor-${var.environment}"
  role             = var.role_arn
  handler          = "index.handler"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime          = "python3.11"
  timeout          = 30
  memory_size      = 256

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  environment {
    variables = {
      ENVIRONMENT    = var.environment
      S3_BUCKET_NAME = var.s3_bucket_name
    }
  }

  tags = {
    Name        = "lambda-image-processor-${var.environment}"
    Environment = var.environment
  }
}

# Mapeo de evento SQS para desencadenar la Lambda
resource "aws_lambda_event_source_mapping" "sqs_trigger" {
  event_source_arn = var.sqs_queue_arn
  function_name    = aws_lambda_function.image_processor.arn
  batch_size       = 10
  enabled          = true
}