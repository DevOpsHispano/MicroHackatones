# Create a variable for our domain name because we'll be using it a lot.
variable "www_domain_name" {
  default = "www.jcbm-domain-1357924680.me"
}

# We'll also need the root domain (also known as zone apex or naked domain).
variable "root_domain_name" {
  default = "jcbm-domain-1357924680.me"
}

variable "bucket_name" {
  type = string
  description = "Name of the bucket."
  default = "bucket-jcbm-domain-1357924680"
}
