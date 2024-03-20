terraform {
  backend "s3" {
    bucket = "jcbm-backend-bucket" # Bucket name for the Terraform state backend
    key    = "terraform.tfstate" # Name of the state file in the bucket
    region = "us-east-1" # Region where the bucket is located
  }
}
