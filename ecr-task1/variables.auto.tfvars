region         = "us-east-1"
ecr_name       = "myecr-hw1"
img_mutability = "IMMUTABLE"
encrypt_type   = "KMS"
scan_img       = true
ecr_tags = {
  "env"     = "dev"
  "owner"   = "Shokhrukh"
  "billing" = "500MB free-tier"
}