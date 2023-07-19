module "aws_instance" {
  source        = "../../child_module/webserver"
  instance_type = "t2.micro"
  key_name      = "tugba_mac_key"

}