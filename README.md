# Docker Toolkit

## 介绍
开发者常用docker开发环境

如php、nginx、redis、mysql、mongodb、consul

## 安装教程

创建环境变量文件
```shell
copy .env.example .env
```
按需构建容器示例
```shell
docker-compose up -d php nginx mysql redis 
```

## 使用说明

如过构建失败，可以先拉取基础镜像再构建

##### 构建PHP示例：

##### 1.拉取php
```shell
docker pull docker.io/library/php:8.2-fpm-alpine
```
##### 2.拉取composer
```shell
docker pull docker.io/library/composer:latest
```
##### 3.构建PHP容器
```shell
docker-compose up -d --build php redis nginx mysql 
```
其它的也是看提示先去拉取基础镜像在构建

### 如果shell 终端还是不行，就设置终端代理
步骤1
```shell
vim  ~/.zshrc
```
步骤2
```shell
export http_proxy=http://127.0.0.1:10808
export https_proxy=http://127.0.0.1:10808
export all_proxy=socks5://127.0.0.1:10808
```
步骤3
```shell
source ~/.zshrc
```

### 构建跨平台镜像并推送到远程仓库
参考文档：http://wiki.tjnccy.cn/page/display?document_id=231
构建全部
```shell
docker buildx bake --push
```
指定特定服务
```shell
docker buildx bake --push rabbitmq

#强制不使用缓存
docker buildx bake --push --no-cache rabbitmq

```

### 代理
在docker-compose.yml服务里面添加环境变量,下面的只是例子，具体的代理地址请自行修改
```yml
environment:
  - HTTP_PROXY=http://host.docker.internal:10808
  - HTTPS_PROXY=http://host.docker.internal:10808
  - NO_PROXY=localhost,127.0.0.1,docker.internal
  - http_proxy=http://host.docker.internal:10808
  - https_proxy=http://host.docker.internal:10808
  - no_proxy=localhost,127.0.0.1,docker.internal
```
