output "k8-server-publicip" {
  value = module.k8-ec2.k8-publicip
  
}

output "k8-server-privateip" {
  value = module.k8-ec2.k8-privateip
}

#OUTPUT PUBLIC IP OF EC2 INSTANCE
output "Display_JenkinsKey" {
  value = module.master-ec2.ACCESS_YOUR_JENKINS_HERE
}


 

# OUTPUT PUBLIC IP OF EC2 INSTANCE
output "DISPLAY_MASTER_SERVER_PUBLIC_IP" {
  value = module.master-ec2.MASTER_SERVER_PUBLIC_IP
}

# OUTPUT PRIVATE IP OF EC2 INSTANCE
output "DISPLAY_MASTER_SERVER_PRIVATE_IP" {
  value = module.master-ec2.MASTER_SERVER_PRIVATE_IP
}