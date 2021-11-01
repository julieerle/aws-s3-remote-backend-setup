# Resources
resource "aws_s3_bucket" "julie-remote-state" {
  bucket = "julie-remote-state"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

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
          "Action" : "s3:*",
          "Principal" : {
            "Federated" : "arn:aws:iam::323533494701:*"
          },
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

resource "aws_s3_bucket_object" "aws-sandbox-dev" {
  bucket = aws_s3_bucket.julie-remote-state.id
  key    = "aws-sandbox/dev/"
}

resource "aws_dynamodb_table" "julie-terraform-state-lock-dynamo" {
  name           = "julie-terraform-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  server_side_encryption {
    enabled = true
  }

  # This configuration combines some "default" tags with optionally provided additional tags
  tags = merge(
    local.common_tags,
    {
      Name = "julie-terraform-state-lock-dynamo"
    },
  )

  lifecycle {
    ignore_changes = [tags]
  }
}
