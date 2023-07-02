resource "aws_security_group" "bastion_sg" {
  name_prefix = "bastion_sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # best-practice: my-pc-public-ip
  }
}

resource "aws_security_group" "mysql_sg" {
  name_prefix = "mysql_sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }
}