#!/bin/bash

# Variables
BACKEND_BUCKET_NAME="jcbm-backend-bucket"
REGION="us-east-1"

# Create the backend bucket
aws s3 mb s3://$BACKEND_BUCKET_NAME --region $REGION

# Enable bucket encryption
aws s3api put-bucket-encryption \
    --bucket $BACKEND_BUCKET_NAME \
    --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'

# Show success message
echo "Bucket de backend creado exitosamente: $BACKEND_BUCKET_NAME"
