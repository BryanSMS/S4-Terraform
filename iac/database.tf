resource "docker_container" "database" {
  name  = "bd-${terraform.workspace}"
  image = docker_image.postgres.image_id

  env = [
    "POSTGRES_PASSWORD=postgres",
    "POSTGRES_USER=postgres",
    "POSTGRES_DB=app_${terraform.workspace}"
  ]

  networks_advanced {
    name = docker_network.env_network.name
  }

  ports {
    internal = 5432
    external = var.db_port[terraform.workspace]
  }
}