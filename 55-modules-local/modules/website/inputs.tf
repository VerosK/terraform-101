
# modules/website/website/inputs.tf

variable "bucket_name" {
    type = string
    description = "Name of the bucket to use"
}

variable "domain_name" {
    type = string
    description = "Name of the domain to create"
}

variable "create_robots_txt" {
    type = bool
    default = true
    description = "Should we create robots.txt file?"
}
