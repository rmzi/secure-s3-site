# S3 Bucket configured as a website backend
resource "aws_s3_bucket" "site" {
  bucket = var.dns.zone
  acl = "public-read"

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  cors_rule {
    allowed_headers = var.cors_allowed_headers
    allowed_methods = var.cors_allowed_methods
    allowed_origins = var.cors_allowed_origins
    expose_headers  = var.cors_expose_headers
    max_age_seconds = var.cors_max_age_seconds
  }
}

resource "aws_s3_bucket_policy" "full-s3-access" {
  bucket = aws_s3_bucket.site.id
  policy = data.aws_iam_policy_document.full_s3_access.json
}

data "aws_iam_policy_document" "full_s3_access" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.site.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_bucket_object" "html" {
  for_each = fileset(path.module, "www/**/*.html")

  acl = "public-read"
  bucket = aws_s3_bucket.site.id
  key    = replace(each.value, "www/", "")
  source = each.value
  etag = filemd5(each.value)
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "css" {
  for_each = fileset(path.module, "www/**/*.css")

  acl = "public-read"
  bucket = aws_s3_bucket.site.id
  key    = replace(each.value, "www/", "")
  source = each.value
  etag = filemd5(each.value)
  content_type = "text/css"
}

resource "aws_s3_bucket_object" "js" {
  for_each = fileset(path.module, "www/**/*.js")

  acl = "public-read"
  bucket = aws_s3_bucket.site.id
  key    = replace(each.value, "www/", "")
  source = each.value
  etag = filemd5(each.value)
  content_type = "text/javascript"
}

resource "aws_s3_bucket_object" "pngs" {
  for_each = fileset(path.module, "www/**/*.png")

  acl = "public-read"
  bucket = aws_s3_bucket.site.id
  key    = replace(each.value, "www/", "")
  source = each.value
  etag = filemd5(each.value)
  content_type = "image/png"
}