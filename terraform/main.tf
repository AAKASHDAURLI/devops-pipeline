terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "latest"  # Specify version if needed (e.g., "2.15.0")
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx_image" {
  name = "my-html-app"
  build {
    context    = "."
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "nginx_container" {
  name  = "nginx_container"
  image = docker_image.nginx_image.name
  ports {
    internal = 80
    external = 9090
  }
}
