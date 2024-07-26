output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.server_instance.public_ip
}