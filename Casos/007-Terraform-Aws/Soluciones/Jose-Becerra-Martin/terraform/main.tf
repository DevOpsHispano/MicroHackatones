# Call to the module to create the static site
module "static_site" {
  source = "./modules/static_site"
}

# URL output
output "cloudfront_url" {
  value = module.static_site.cloudfront_url
}
