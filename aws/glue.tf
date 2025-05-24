resource "aws_glue_catalog_database" "yt-glue-db" {
  name = "yt-glue-db"
}

resource "aws_glue_crawler" "yt-glue-crawler" {
  database_name = aws_glue_catalog_database.yt-glue-db.name
  name          = "yt-glue-crawler"
  role          = aws_iam_role.yt-glue-crawler_iam_role.arn

  s3_target {
    path = "s3://${aws_s3_bucket.my_bucket.bucket}/raw_statistics_reference_data/"
  }
}