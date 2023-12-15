resource "aws_key_pair" "stack-key" {
  key_name = "stack-key"
  public_key = file("../stack-key.pub")
}

resource "aws_instance" "kops-instance" {
  ami = var.amis[var.region]
  instance_type = "t2.micro"
  key_name = aws_key_pair.stack-key.key_name
  vpc_security_group_ids = [ aws_security_group.kops-sg.id ]
  tags = {
    Name = "kops-instance"
  }

  provisioner "file" {
    source = "../scripts/kops.sh"
    destination = "/tmp/kops.sh"
  }

  provisioner "remote-exec" {
    inline = [ 
       "sudo chmod u+x /tmp/kops.sh",
       "sudo /tmp/kops.sh",
       "cd"
    ]
  }

  connection {
    user = var.user
    private_key = file("../stack-key")
    host = self.public_ip
  }
}

resource "aws_instance" "jenkins-instance" {
  ami = var.amis[var.region]
  instance_type = "t2.small"
  key_name = aws_key_pair.stack-key.key_name
  vpc_security_group_ids = [ aws_security_group.jenkins-sg.id ]
  tags = {
    Name = "jenkins-instance"
  }

  provisioner "file" {
    source = "../scripts/jenkins.sh"
    destination = "/tmp/jenkins.sh"
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo chmod u+x /tmp/jenkins.sh",
      "sudo /tmp/jenkins.sh",
      "cd"
    ]
  }

  connection {
    user = var.user
    private_key = file("../stack-key")
    host = self.public_ip
  }
}

resource "aws_instance" "sonar-instance" {
  ami = var.amis[var.region]
  instance_type = "t2.medium"
  key_name = aws_key_pair.stack-key.key_name
  vpc_security_group_ids = [ aws_security_group.sonar-sg.id ]
  tags = {
    Name = "sonar-instance"
  }

  provisioner "file" {
    source = "../scripts/sonar.sh"
    destination = "/tmp/sonar.sh"
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo chmod u+x /tmp/sonar.sh",
      "sudo /tmp/sonar.sh"
    ]
  }

  connection {
    user = var.user
    private_key = file("../stack-key")
    host = self.public_ip
  }
}