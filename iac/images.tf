resource "docker_image" "nginx" {
    name = "nginx:aplpine"
    keep_locally = true
}
resource "docker_image" "node" {
    name = "node:alpine"
    keep_locally = true
}
resource "docker_image" "postgres" {
    name = "postgres:alpine"
    keep_locally = true
}

