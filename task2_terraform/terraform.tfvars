containers = [
  {
    image         = "nginx"
    name          = "nginx_container"
    internal_port = 80
    external_port = 8080
    environment   = "dev"
  },
  {
    image         = "jenkins/jenkins:lts-jdk11"
    name          = "jenkins_container"
    internal_port = 8080
    external_port = 8081
    environment   = "stage"
  },
  {
    image         = "redis"
    name          = "redis_container"
    internal_port = 6379
    external_port = 8082
    environment   = "prod"
  }
]