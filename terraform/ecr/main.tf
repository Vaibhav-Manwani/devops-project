resource "aws_ecr_repository" "project-repo" {
  for_each             = toset(["frontend", "backend"])
  name                 = each.value
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}