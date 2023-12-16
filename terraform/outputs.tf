output "kops-public-ip" {
  value = aws_instance.kops-instance.public_ip
}

output "jenkins-public-ip" {
  value = aws_instance.jenkins-instance.public_ip
}

output "sonar-public-ip" {
  value = aws_instance.sonar-instance.public_ip
}

output "Post-installation" {
  value = "Please manually reboot the sonar and jenkins servers"
}