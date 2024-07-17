output "jenkins-public-ip" {
  description = "Public IP for Jenkins EC2 instance"
  value       = resource.aws_instance.jenkins.public_ip
}