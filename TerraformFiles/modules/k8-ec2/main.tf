#Server2 Kubernetes 

resource "aws_instance" "my_ec2_instance2" {
  ami                    = var.ami
  instance_type          = var.instance_type # K8s requires min 2CPU & 4G RAM
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  # Consider EBS volume 30GB
  root_block_device {
    volume_size = var.volume_size    # Volume size 30 GB
    volume_type = var.volume_type # General Purpose SSD
  }

  tags = {
    Name = "K8-NODE-SERVER"
  }

  # S USING REMOTE-EXEC PROVISIONER TO INSTALL TOOLS
  provisioner "remote-exec" {
    # ESTABLISHING SSH CONNECTION WITH EC2
    connection {
      type        = "ssh"
      private_key = file(var.private_key_path) 
      user        = var.instance_user
      host        = self.public_ip
    }

      script = "${path.module}/kubernetes-setup.sh"
    }
  
}