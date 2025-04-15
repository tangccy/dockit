# php-work

## 介绍
php开发者常用docker开发环境

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

如过构建失败，可以先拉去镜像再构建

##### 构建PHP示例：

1.拉去php
```shell
docker pull docker.io/library/php:8.2-fpm-alpine
```
2.拉去composer
```shell
docker.io/library/composer:latest
```
3.构建PHP容器
```shell
docker-compose up -d --build php
```
其它的也是看提示先去拉去基础镜像在构建
