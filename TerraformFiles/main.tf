module "sg" {
  source        = "./modules/sg"
ingress_rules = var.ingress_rules
egress_rules  = var.egress_rules
}


module "master-ec2" {
  source           = "./modules/master-ec2"
  ami              = var.ami
  instance_type    = var.instance_type
  key_name         = var.key_name
  instance_user    = var.instance_user
  volume_size      = var.volume_size
  volume_type      = var.volume_type
  private_key_path = var.private_key_path
  sgid             = module.sg.sg-id

}



module "k8-ec2" {
  source            = "./modules/k8-ec2"
  ami               = var.ami
  instance_type     = var.instance_type
  key_name          = var.key_name
  instance_user     = var.instance_user
  volume_size       = var.volume_size
  volume_type       = var.volume_type
  private_key_path  = var.private_key_path
  security_group_id = module.sg.sg-id
}



