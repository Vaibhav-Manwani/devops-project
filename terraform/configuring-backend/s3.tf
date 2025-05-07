resource "aws_s3_bucket" "terra-backup" {
  bucket = "myterra-backup-tf"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}