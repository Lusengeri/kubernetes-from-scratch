resource "aws_security_group" "alb_sg" {
  name   = "${var.namespace}-alb-sg"
  vpc_id = aws_vpc.vpc.id

  ingress {
    description = "allow all connections on port 6443 from internet"
    from_port   = 6443 
    to_port     = 6443 
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.namespace}-alb-sg"
  }
}