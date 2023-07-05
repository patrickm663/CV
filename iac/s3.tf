// S3 bucket for CV
resource "aws_s3_bucket" "bucket" {
    bucket = "patrick-moehrke-cv-pdf"
}

// Allow public access
resource "aws_s3_bucket_public_access_block" "bucket" {
    bucket = aws_s3_bucket.bucket.id

    block_public_acls 	= false
    block_public_policy	= false
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.My_bucket.id
  acl    = "public-read"
}
