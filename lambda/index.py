import json
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def handler(event, context):
    logger.info("Procesando evento de imagen...")
    logger.info(json.dumps(event))

    return {
        'statusCode': 200,
        'body': json.dumps('Imagen procesada exitosamente')
    }