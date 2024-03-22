# Call to the module to create the static site
module "static_site" {
  source = "./modules/static_site"

# Import variables to module
  www_domain_name = var.www_domain_name
  root_domain_name = var.root_domain_name
  bucket_name = var.bucket_name
  env = var.env
}

# URL output
output "cloudfront_url" {
  value = module.static_site.cloudfront_url
}
