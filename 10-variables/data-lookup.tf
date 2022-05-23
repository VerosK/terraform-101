data "aws_ami" "centos" {                      
  executable_users = ["self"]                  
  most_recent      = true                      
  owners           = ["aws-marketplace"]       
  filter {                                     
    name = "architecture"                      
    values = [ "x86_64" ]                      
  }                                            
  filter {                                     
    name = "product-code"                      
    values = [ "aw0evgkw8e5c1q413zgy5pjce" ]   
  }                                            
                                               
  filter {                                     
    name   = "root-device-type"                
    values = ["ebs"]                           
  }                                            
                                               
  filter {                                     
    name   = "virtualization-type"             
    values = ["hvm"]                           
  }                                            
}                                              

