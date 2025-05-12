terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.0.0"  # You can keep the version you need
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"  # or appropriate Docker host URL
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
    external = 9090  # Expose the container on port 9090
  }
}
