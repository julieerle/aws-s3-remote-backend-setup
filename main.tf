#  Data Lookups

# Resources
resource "aws_s3_bucket" "julie-remote-state" {
  bucket = "julie-remote-state"

  versioning {
    enabled = true
  }

  tags = local.common_tags
}

resource "aws_s3_bucket_policy" "julie-remote-state-policy" {
  bucket = aws_s3_bucket.julie-remote-state.id

  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Id" : "Policy1634251950551",
      "Statement" : [
        {
          "Sid" : "AllowAccesstoTeam",
          "Effect" : "Allow",
          "Principal" : {
            "Federated" : "arn:aws:iam::323533494701:*"
          },
          "Action" : "s3:*",
          "Resource" : [
            "arn:aws:s3:::julie-remote-state",
            "arn:aws:s3:::julie-remote-state/*"
          ]
        }
      ]
    }
  )
}

resource "aws_s3_bucket_public_access_block" "julie-remote-state" {
  bucket = aws_s3_bucket.julie-remote-state.id

  block_public_acls   = true
  block_public_policy = true
}

# resource "aws_instance" "app_server" {
#   ami           = "ami-830c94e3"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "ExampleAppServerInstance"
#   }
# }