# CREATING A SECURITY GROUP FOR JENKINS SERVER and K8
# Description: Allow SSH, HTTP, HTTPS, 8080, 8081, 6443, 8001 ,10250 ,30000

resource "aws_security_group" "namy-security-group1" {
   name        = "my-security-group1"
  description = "Allow SSH, HTTP, HTTPS, 8080 for Jenkins & Maven"

   # dynamic SSH Inbound Rules
   dynamic "ingress" {
     
     for_each = var.ingress_rules
     content {
       to_port = ingress.value.to_port
       from_port = ingress.value.from_port
       protocol = ingress.value.protocol
       cidr_blocks = ingress.value.cidr_blocks

     }
   }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}