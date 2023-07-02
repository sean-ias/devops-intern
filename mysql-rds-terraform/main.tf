resource "aws_instance" "bastion_host" {
  ami                    = "ami-0c94855ba95c71c99" # Amazon Linux 2 AMI ID
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.mykey.key_name
  subnet_id              = aws_subnet.pub_subnet.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "bastion-host"
  }
}

resource "aws_db_instance" "my_db_instance" {
  identifier             = "mydb"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t2.micro"
  storage_type           = "gp2"
  allocated_storage      = 10
  db_name                = "mydb"
  username               = "admin"
  password               = "password"
  publicly_accessible    = false
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.my_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.mysql_sg.id]

  tags = {
    owner = "Shokhrukh"
    name  = "mysql-rds-instance"
  }
}