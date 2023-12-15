resource "aws_security_group" "kops-sg" {
  vpc_id = var.vpc_id
  name = "kops-sg"
  description = "Security group for kOps controller"

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ var.myip ]
  }

  tags = {
    Name = "kops-sg"
  }
}

resource "aws_security_group" "jenkins-sg" {
  vpc_id = var.vpc_id
  name = "jenkins-sg"
  description = "Security group for Jenkins"

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ var.myip ]
  }

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = [ var.myip ]
  }

  tags = {
    Name = "jenkins-sg"
  }
}

resource "aws_security_group" "sonar-sg" {
  vpc_id = var.vpc_id
  name = "sonar-sg"
  description = "Security group for SonarQube"

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ var.myip ]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ var.myip ]
  }

  tags = {
    Name = "sonar-sg"
  }
}