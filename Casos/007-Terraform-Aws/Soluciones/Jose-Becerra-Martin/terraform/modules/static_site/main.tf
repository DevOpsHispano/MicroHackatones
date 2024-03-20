resource "aws_cloudfront_distribution" "www_distribution" {
  # origin is where CloudFront gets its content from.
  origin {
    # We need to set up a "custom" origin because otherwise CloudFront won't
    # redirect traffic from the root domain to the www domain
    custom_origin_config {
      # These are all the defaults.
      http_port              = "80"
      https_port             = "443"
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }

    # Here we're using our S3 website bucket's URL!
    domain_name = "${aws_s3_bucket_website_configuration.www-config.website_endpoint}"

    # This can be any name to identify this origin.
    origin_id   = "${var.www_domain_name}"
  }

  enabled             = true
  default_root_object = "index.html"

  # All values are defaults from the AWS console.
  default_cache_behavior {
    cache_policy_id  = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    # This needs to match the `origin_id` above.
    target_origin_id       = "${var.www_domain_name}"
    min_ttl                = 0
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
