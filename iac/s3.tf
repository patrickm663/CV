// S3 bucket for CV
resource "aws_s3_bucket" "bucket" {
    bucket = "patrick-moehrke-cv-pdf"
}

// Allow public access
resource "aws_s3_bucket_public_access_block" "bucket" {
    bucket = aws_s3_bucket.bucket.id
    block_public_acls 		= false
    block_public_policy		= false
    ignore_public_acls 		= false
    restrict_public_buckets 	= false
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.bucket

  # Terraform's "jsonencode" function converts a
  # Terraform expression's result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "CVBUCKETPOLICY"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = [
                "s3:GetObject"
            ]
        Resource = [
          "${aws_s3_bucket.bucket.arn}/*",
        ]
      },
    ]
  })
}
