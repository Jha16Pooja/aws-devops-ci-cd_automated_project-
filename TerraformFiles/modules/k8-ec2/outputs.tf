output "k8-publicip" {
  value = aws_instance.my_ec2_instance2.public_ip
}

output "k8-privateip" {
  value = aws_instance.my_ec2_instance2.private_ip
}