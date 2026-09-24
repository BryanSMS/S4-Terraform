resource "docker_container" "backend" {
  name  = "api-${terraform.workspace}"
  image = docker_image.node.image_id

  command = [
    "node",
    "-e",
    "require('http').createServer((req, res) => res.end('API OK - Env: ' + process.env.NODE_ENV)).listen(3000, () => console.log('API running'))"
  ]

  env = [
    "NODE_ENV=${terraform.workspace}",
    "DB_HOST=bd-${terraform.workspace}",
    "DB_PORT=5432"
  ]

  networks_advanced {
    name = docker_network.env_network.name
  }

  ports {
    internal = 3000
    external = var.api_port[terraform.workspace]
  }
}