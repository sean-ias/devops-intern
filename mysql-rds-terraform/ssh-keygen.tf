# Generate new private key 
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Generate a key-pair with above key
resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = tls_private_key.rsa.public_key_openssh
}

# Saving Key Pair for ssh login for Client if needed
resource "local_file" "save_key_pair" {
  content         = tls_private_key.rsa.private_key_pem
  filename        = "mykey.pem"
  file_permission = "0400"
}