# SERVER1: 'MASTER-SERVER' (with Jenkins, Maven, Docker, Ansible, Trivy
# CREATE AN JENKINS EC2 INSTANCE USING EXISTING PEM KEY

resource "aws_instance" "my_ec2_instance1" {
  instance_type = var.instance_type
  ami = var.ami
  key_name = var.key_name # SSH key name for the EC2 instance
  vpc_security_group_ids = [var.sgid] 
  tags = {
    Name = "MASTER-SERVER"
  }


   # Consider EBS volume 30GB
  root_block_device {
    volume_size = var.volume_size    # Volume size 30 GB
    volume_type = var.volume_type # General Purpose SSD
  }

  #user_data = file("${path.module}/maven.sh")

 # USING REMOTE-EXEC PROVISIONER TO INSTALL TOOLS
  provisioner "remote-exec" {
    # ESTABLISHING SSH CONNECTION WITH EC2
    connection {
      type        = "ssh"
      private_key = file(var.private_key_path) # Private key for SSH connection
      user        = var.instance_user    # Username for SSH connection
      host        = self.public_ip        # Public IP of the EC2 instance
    }
    # Path to the shell script for installing Jenkins and other tools
    #inline = var.provisioner_scripts
    script = "${path.module}/jenkins-setup.sh"
  }


}