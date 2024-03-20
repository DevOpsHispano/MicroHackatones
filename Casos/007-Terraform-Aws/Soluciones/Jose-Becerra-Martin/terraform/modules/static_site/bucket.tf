# Creación del bucket S3 para el sitio estático público
resource "aws_s3_bucket" "www" {
  bucket = "${var.bucket_name}"
}

data "aws_s3_bucket" "selected-bucket" {
  bucket = aws_s3_bucket.www.bucket
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = data.aws_s3_bucket.selected-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "public-acces-block" {
  bucket = data.aws_s3_bucket.selected-bucket.bucket
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

  # Esperar 10 segundos después de la creación de la instancia
  provisioner "local-exec" {
    command = "sleep 10"
  }
}

resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = data.aws_s3_bucket.selected-bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::${var.bucket_name}/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.public-acces-block]
}

resource "aws_s3_bucket_cors_configuration" "example" {
  bucket = data.aws_s3_bucket.selected-bucket.bucket
  cors_rule {
      allowed_headers = ["Authorization", "Content-Length"]
      allowed_methods = ["GET", "POST"]
      allowed_origins = ["https://${var.www_domain_name}"]
      max_age_seconds = 3000
    }
}

resource "aws_s3_object" "object-upload-html" {
    for_each        = fileset("${path.module}/uploads/", "*.html")
    bucket          = data.aws_s3_bucket.selected-bucket.bucket
    key             = each.value
    source          = "${path.module}/uploads/${each.value}"
    content_type    = "text/html"
    etag            = filemd5("${path.module}/uploads/${each.value}")
}

resource "aws_s3_bucket_website_configuration" "www-config" {
  bucket = data.aws_s3_bucket.selected-bucket.bucket
  index_document {
      suffix = "index.html"
    }
  error_document {
      key = "404.html"
    }
}
