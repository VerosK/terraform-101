# modules/website/objects.tf

resource "aws_s3_object" "index" {
  bucket  = var.bucket_name
  key     = "${var.domain_name}/index.html"
  content =<<EOF
<h1>Hello, world!</h1>

<p>${var.domain_name}</p>
EOF

}

resource "aws_s3_object" "robots" {
  count = var.create_robots_txt ? 1 : 0
  bucket  = var.bucket_name
  key     = "${var.domain_name}/robots.txt"
  content =<<EOF
User-agent: *
Disallow: /
EOF
}

