# Infrastructure as Code (IaC) - Serverless Image Processor

Este repositorio contiene la arquitectura de infraestructura como código (IaC) desarrollada con **Terraform** en **AWS** para un procesador de imágenes serverless desacoplado, escalable y resiliente.

##  Arquitectura del Sistema

El flujo de trabajo de la infraestructura se compone de los siguientes servicios:

1. **API Gateway (REST API):** Punto de entrada HTTP público para recibir solicitudes de procesamiento de imágenes (`POST /images`).
2. **Amazon S3:** Almacenamiento de objetos seguro para cargar y consultar imágenes.
3. **Amazon SQS & DLQ:** Desacoplamiento de eventos mediante colas de mensajes con una *Dead Letter Queue* (DLQ) para tolerancia a fallos.
4. **AWS Lambda (Python 3.11):** Procesamiento de imágenes activado por eventos (*event-driven execution*).
5. **AWS IAM:** Roles y políticas con principio de mínimo privilegio.
6. **Amazon CloudWatch:** Logs de ejecución y alarmas de monitoreo para Lambda y SQS.
7. **AWS VPC:** Red aislada con subnets públicas/privadas, Internet Gateway y NAT Gateways.

---

## Estructura del Repositorio

```text
iac-image-processor/
├── lambda/
│   └── index.py               # Código fuente Python de la función Lambda
├── modules/
│   ├── api_gateway/           # REST API e integraciones con Lambda
│   ├── iam/                   # Roles y políticas de menor privilegio
│   ├── lambda/                # Configuración y empaquetado ZIP de la función
│   ├── monitoring/            # CloudWatch Log Groups y Alarmas
│   ├── network/               # VPC, Subnets y Tabla de Ruteo
│   ├── s3/                    # Bucket para imágenes
│   ├── security/              # Security Groups
│   └── sqs/                   # Cola de procesamiento y DLQ
└── environments/
    ├── dev/                   # Entorno de Desarrollo
    └── prod/                  # Entorno de Producción