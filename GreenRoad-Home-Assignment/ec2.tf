resource "aws_instance" "ec2" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.xlarge"
  //iam_instance_profile   = aws_iam_instance_profile.profile.name
  key_name                    = aws_key_pair.default.key_name
  security_groups             = [aws_security_group.itay-zrihan-sg-ec2-instance.id]
  user_data_base64            = filebase64("${path.module}/user-data.sh")
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public-us-east-1a.id
  tags = {
    Name = "itay-zrihan-ec2-instance"
    
  }
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "default" {
  key_name   = "keypair"
  public_key = tls_private_key.key.public_key_openssh

  tags = {
    Name = "itay-zrihan-keypair"
  }
}