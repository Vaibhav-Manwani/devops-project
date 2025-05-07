terraform {
  backend "s3" {
    bucket = "myterra-backup-tf"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terra-table"
  }
}
