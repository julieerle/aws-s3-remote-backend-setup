output "state-locatedin-s3-bucket" {
  value       = aws_s3_bucket.julie-remote-state.id
  description = "The S3 bucket where Terraform remote state is located."
  sensitive   = false
}