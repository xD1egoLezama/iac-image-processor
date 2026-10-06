# Security Group para la Lambda de Procesamiento en VPC
resource "aws_security_group" "lambda_sg" {
  name        = "sg-lambda-processor-${var.environment}"
  description = "Security Group para las funciones Lambda de procesamiento de imagenes"
  vpc_id      = var.vpc_id

  # Regla de salida: Permitir todo el trafico saliente (para conectar a S3, SQS, etc.)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "sg-lambda-processor-${var.environment}"
    Environment = var.environment
  }
}