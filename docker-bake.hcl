group "default" {
  targets = ["php", "nginx", "redis", "mysql", "mongo", "consul", "go", "rabbitmq"]
}

target "php" {
  context = "./php"
  dockerfile = "Dockerfile"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = ["registry.cn-hangzhou.aliyuncs.com/kanin/php:1.0"]
  push = true
}

target "nginx" {
  context = "./nginx"
  dockerfile = "Dockerfile"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = ["registry.cn-hangzhou.aliyuncs.com/kanin/nginx:1.0"]
  push = true
}

target "redis" {
  context = "./redis"
  dockerfile = "Dockerfile"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = ["registry.cn-hangzhou.aliyuncs.com/kanin/redis:1.0"]
  push = true
}

target "mysql" {
  context = "./mysql"
  dockerfile = "Dockerfile"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = ["registry.cn-hangzhou.aliyuncs.com/kanin/mysql:1.0"]
  push = true
}

target "mongo" {
  context = "./mongo"
  dockerfile = "Dockerfile"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = ["registry.cn-hangzhou.aliyuncs.com/kanin/mongo:1.0"]
  push = true
}

target "consul" {
  context = "./consul"
  dockerfile = "Dockerfile"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = ["registry.cn-hangzhou.aliyuncs.com/kanin/consul:1.0"]
  push = true
}

target "go" {
  context = "./go"
  dockerfile = "Dockerfile"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = ["registry.cn-hangzhou.aliyuncs.com/kanin/go:1.0"]
  push = true
}

target "rabbitmq" {
  context = "./rabbitmq"
  dockerfile = "Dockerfile"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = ["registry.cn-hangzhou.aliyuncs.com/kanin/rabbitmq:3.13"]
  push = true
}
