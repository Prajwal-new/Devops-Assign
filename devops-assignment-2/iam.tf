resource "aws_iam_role" "s3_read_role" {
  name = "s3-read-only-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "s3_read_policy" {
  name        = "s3-read-only-policy"
  description = "Allows read-only access to S3"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = ["s3:ListBucket", "s3:GetObject"],
      Resource = "*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "read-attach" {
  role       = aws_iam_role.s3_read_role.name
  policy_arn = aws_iam_policy.s3_read_policy.arn
}

resource "aws_iam_role" "s3_write_role" {
  name = "s3-write-only-role"

  assume_role_policy = aws_iam_role.s3_read_role.assume_role_policy
}

resource "aws_iam_policy" "s3_write_policy" {
  name        = "s3-write-only-policy"
  description = "Allows only write access to S3"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = ["s3:PutObject", "s3:ListBucket"],
      Resource = "*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "write-attach" {
  role       = aws_iam_role.s3_write_role.name
  policy_arn = aws_iam_policy.s3_write_policy.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-write-profile"
  role = aws_iam_role.s3_write_role.name
}