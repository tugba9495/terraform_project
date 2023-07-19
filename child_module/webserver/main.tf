resource "aws_instance" "wordpress_server_instance" {
    ami = data.aws_ami.amazon_linux_2023_ami.id
    key_name = var.key_name
    associate_public_ip_address = true

    subnet_id = data.aws_subnet.subnet_id.id
    instance_type = var.instance_type
    tags = merge(local.common_tags,
    {
        Name = "wordpress_server_instance"
    }
        

   
    )
  }

    
