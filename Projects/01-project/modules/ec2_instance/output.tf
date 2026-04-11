output "public-ip-address" {
    value = aws_instance.example.public_ip
  }
output "public-dns" {
    value = aws_instance.example.public_dns
}
output "vpc_id" {  
  value = aws_instance.example.vpc_id
  }