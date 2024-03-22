# Creating the S3 bucket for the public static site
resource "aws_s3_bucket" "www" {
  bucket = "${var.bucket_name}"
}

# Enabling versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.www.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Configuring public access block settings for the S3 bucket
resource "aws_s3_bucket_public_access_block" "public-acces-block" {
  bucket = aws_s3_bucket.www.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

  # Waiting for 10 seconds after the provisioner creation
  provisioner "local-exec" {
    command = "sleep 10"
  }
}

# Applying a bucket policy to allow public read access
resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = aws_s3_bucket.www.id

  policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.www.arn}/*"
      }
    ]
  })

  # Ensuring that the bucket policy is applied after the public access block
  depends_on = [aws_s3_bucket_public_access_block.public-acces-block]
}

# Configuring CORS (Cross-Origin Resource Sharing) for the S3 bucket
resource "aws_s3_bucket_cors_configuration" "example" {
  bucket = aws_s3_bucket.www.bucket

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://${var.www_domain_name}"]
    max_age_seconds = 3000
  }
}

# Uploading HTML objects to the S3 bucket
resource "aws_s3_object" "object-upload-html" {
  for_each      = fileset("${path.module}/uploads/${var.env}/", "*.html")
  bucket        = aws_s3_bucket.www.bucket
  key           = each.value
  source        = "${path.module}/uploads/${var.env}/${each.value}"
  content_type  = "text/html"
  etag          = filemd5("${path.module}/uploads/${var.env}/${each.value}")
}

# Configuring website hosting for the S3 bucket
resource "aws_s3_bucket_website_configuration" "www-config" {
  bucket = aws_s3_bucket.www.bucket

  index_document {
    suffix = "index.html"
  }
  
  error_document {
    key = "404.html"
  }
}
