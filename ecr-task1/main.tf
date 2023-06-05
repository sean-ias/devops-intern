resource "aws_ecr_repository" "my_ecr" {

  name = var.ecr_name

  image_tag_mutability = var.img_mutability

  encryption_configuration {
    encryption_type = var.encrypt_type
  }

  image_scanning_configuration {
    scan_on_push = var.scan_img
  }

  tags = var.ecr_tags
}