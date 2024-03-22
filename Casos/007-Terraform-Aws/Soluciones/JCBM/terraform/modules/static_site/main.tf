resource "aws_cloudfront_distribution" "www_distribution" {
  # A comment describing the purpose of this CloudFront distribution
  comment = "(${var.env}) Jose's CloudFront distribution - Managed via Terraform"

  # origin is where CloudFront gets its content from.
  origin {
    # We need to set up a "custom" origin because otherwise CloudFront won't
    # redirect traffic from the root domain to the www domain

    # Configuring custom origin settings
    custom_origin_config {
      # These are all the defaults.
      http_port              = "80"   # Default HTTP port
      https_port             = "443"  # Default HTTPS port
      origin_protocol_policy = "http-only"  # Only allow HTTP protocol for communication with the origin
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]  # Supported SSL/TLS protocols
    }

    # Using the S3 website bucket's URL as the origin domain
    domain_name = "${aws_s3_bucket_website_configuration.www-config.website_endpoint}"

    # Any name to identify this origin
    origin_id   = "${var.www_domain_name}"

    # Configuring origin shield settings
    origin_shield {
      enabled              = true
      origin_shield_region = "us-east-1"  # CloudFront region for origin shield
    }
  }

  enabled             = true   # Distribution is enabled
  default_root_object = "index.html"  # Default root object

  # Configuring default cache behavior
  default_cache_behavior {
    cache_policy_id       = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"  # Default cache policy ID
    viewer_protocol_policy = "redirect-to-https"  # Redirect HTTP to HTTPS
    compress               = true  # Enable compression
    allowed_methods        = ["GET", "HEAD"]  # Allowed HTTP methods
    cached_methods         = ["GET", "HEAD"]  # Cached HTTP methods
    target_origin_id       = "${var.www_domain_name}"  # Matching the origin ID defined above
    min_ttl                = 0  # Minimum TTL for objects in cache
  }

  # Configuring restrictions (in this case, no geo restriction)
  restrictions {
    geo_restriction {
      restriction_type = "none"  # No geo restriction
    }
  }

  # Configuring viewer certificate (using CloudFront default certificate)
  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
