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
    external_port = null
    environment   = "stage"
  }
]