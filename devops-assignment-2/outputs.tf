output "instance_public_ip" {
  value = aws_instance.devops_ec2.public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.logs_bucket.bucket_domain_name
}