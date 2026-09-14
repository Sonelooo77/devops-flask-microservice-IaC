variable "image_tag" {
    description = "Docker image tag"
    type = string
    default = "latest"
}

variable "port" {
    description = "Port number"
    type = int
    default = "5000"
}