data "aws_ami" "amazon_linux_2023_ami" {
    owners = ["amazon"]
    most_recent = true
  
    filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }

    
    filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  
    
  
  
}
 data "aws_subnet" "subnet_id" {
    filter {
        name = "tag:Name"
        values = ["public_subnet_1"]
    }

   
 }