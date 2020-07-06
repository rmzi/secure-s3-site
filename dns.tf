# Route53 Domain name and resource records
resource "aws_route53_zone" "site" {
  name = var.dns.zone
}

resource "aws_route53_record" "site" {
  zone_id = aws_route53_zone.site.zone_id
  name    = var.dns.name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.site.domain_name
    zone_id                = aws_cloudfront_distribution.site.hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.site.zone_id
  name    = "www.${var.dns.zone}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.site.domain_name
    zone_id                = aws_cloudfront_distribution.site.hosted_zone_id
    evaluate_target_health = true
  }
}