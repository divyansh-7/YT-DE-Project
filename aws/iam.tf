
#GLUE
#creating a role for AWS Glue Crawler
resource "aws_iam_role" "yt-glue-crawler_iam_role" {
  name = "yt-glue-crawler_iam_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "glue.amazonaws.com"
        }
      },
    ]
  })

}
# Attaching policies to the Glue Crawler IAM role
resource "aws_iam_role_policy_attachment" "glue_attach_s3_full_access" {
  role       = aws_iam_role.yt-glue-crawler_iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "glue_attach_service_role" {
  role       = aws_iam_role.yt-glue-crawler_iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

#=======================================================================================
#=======================================================================================

