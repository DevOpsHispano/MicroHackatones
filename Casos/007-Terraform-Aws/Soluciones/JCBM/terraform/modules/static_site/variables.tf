variable "www_domain_name" {
  description = "Domain name."
}

variable "root_domain_name" {
  description = "Root domain name."
}

variable "bucket_name" {
  type = string
  description = "Name of the bucket."
}

variable "env" {
  description = "Website environment."
}
