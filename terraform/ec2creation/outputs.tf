
#output for metargument for_each
 output "ec2_public_ip" {
   value = [
    for k in aws_instance.project-servers: k.public_ip
   ]
 }

output "ec2_private_ip" {
   value = [
    for k in aws_instance.project-servers: k.private_ip
   ]
}
output "ec2_private_dns" {
   value = [
    for k in aws_instance.project-servers: k.private_dns
   ]
 }