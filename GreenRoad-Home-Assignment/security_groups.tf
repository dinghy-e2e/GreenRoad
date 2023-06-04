resource "aws_security_group" "itay-zrihan-sg-ec2-instance" {
  name        = "itay-zrihan-sg-ec2-instance"
  description = "Security group for EC2 instances"
  vpc_id      = aws_vpc.itay-zrihan-vpc.id

  ingress {
    from_port   = 31234
    to_port     = 31234
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "itay-zrihan-SG"
  }
}
