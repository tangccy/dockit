# Docker Toolkit

一套用于 本地开发环境 + 多架构镜像构建 的 Docker 工具链。

适用于常见后端开发场景，例如：

PHP / Nginx / Redis / MySQL / MongoDB / Consul / RabbitMQ / Go

## 一、设计目标（先看这里）

✅ 本地开发：使用 docker-compose，追求 简单、快速

✅ 镜像构建：使用 docker buildx bake，支持 多架构（amd64 / arm64）

✅ 基础镜像统一维护，避免每个项目重复造轮子

✅ 本地 / CI / 服务器 构建行为一致

## 二、本地开发（docker-compose）
### 1️⃣ 初始化环境变量
```
cp .env.example .env
```

根据需要修改 .env 中的端口、路径等配置。

### 2️⃣ 按需启动服务
```
docker-compose up -d php nginx mysql redis
```

只启动你当前需要的服务即可。

### 3️⃣ 如果构建失败（网络或基础镜像问题）

可以先手动拉取基础镜像，再重新构建。

#### 示例：PHP
```
docker pull docker.io/library/php:8.2-fpm-alpine
docker pull docker.io/library/composer:latest
```

然后重新构建：
```
docker-compose up -d --build php redis nginx mysql
```
## 三、终端代理（拉取镜像慢或失败时， 以下是MAC示例）

如果在终端里 docker pull 经常失败，可以配置本地代理。

### 1️⃣ 编辑 shell 配置 
```
vim ~/.zshrc
```
### 2️⃣ 添加代理配置（示例）
```
export http_proxy=http://127.0.0.1:10808
export https_proxy=http://127.0.0.1:10808
export all_proxy=socks5://127.0.0.1:10808
```
### 3️⃣ 生效配置
```
source ~/.zshrc
```
## 四、跨平台镜像构建（docker buildx bake）

用于 构建并推送多架构镜像，通常在发布或 CI 中使用。

### 1️⃣ 构建全部镜像并推送
```
docker buildx bake --push
```
### 2️⃣ 构建指定服务（示例：rabbitmq）
```
docker buildx bake --push rabbitmq
```
### 3️⃣ 强制不使用缓存
```
docker buildx bake --push --no-cache rabbitmq
```
##  五、Buildx 构建器初始化（只需一次）

如果第一次使用 buildx，或提示 driver 不存在，需要先初始化构建器。
```
docker buildx create --name mybuilder --driver docker-container --use
docker buildx inspect --bootstrap
```
### 说明

- --name mybuilder

构建器名称，仅用于标识，可随意命名

- --driver docker-container

使用容器方式运行 BuildKit（最稳定、最常用）

- --use

设置为当前默认构建器

### 多构建器示例（可选）
```
docker buildx create --name amd64-builder --driver docker-container
docker buildx create --name arm64-builder --driver docker-container

docker buildx use amd64-builder
```

⚠️ 构建器名称不要重复，否则会报错。

## 六、docker-bake.hcl 说明

本项目使用 `docker-bake.hcl` 管理多个镜像的构建规则。

- 每个 target 对应一个服务镜像

- group "default" 用于一次性构建所有镜像

- 统一配置：

    - 构建上下文

    - Dockerfile

    - 多架构平台

    - 镜像 tag

    - 是否 push

如不了解 bake 语法，可自行搜索 `docker buildx bake`。

## 七、Docker 容器内代理（可选）

如果构建阶段或容器运行时需要代理，可在 docker-compose.yml 中添加：
```
environment:
  - HTTP_PROXY=http://host.docker.internal:10808
  - HTTPS_PROXY=http://host.docker.internal:10808
  - NO_PROXY=localhost,127.0.0.1,docker.internal
  - http_proxy=http://host.docker.internal:10808
  - https_proxy=http://host.docker.internal:10808
  - no_proxy=localhost,127.0.0.1,docker.internal
```

请根据实际代理地址修改。

## 八、常见使用场景总结
| 场景     | 使用方式     | 
|----------|---------|
|本地开发	|docker-compose|
|构建基础镜像	|docker buildx bake|
|多架构支持	|buildx + bake|
|CI/CD	|bake + push|
|网络受限	|终端 / 容器代理|

## 九、备注

本工具集主要用于 开发与基础镜像构建

不强制要求全部服务一起启动

推荐根据项目需要裁剪使用
