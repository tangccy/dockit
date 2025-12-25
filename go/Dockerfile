# 使用官方 Golang Alpine 镜像
FROM golang:1.25-alpine

# 设置默认用户为 root
USER root

# 设置 Go 环境
ENV GOPROXY=https://goproxy.cn,direct
ENV GOBIN=/usr/local/bin
ENV PATH=$GOBIN:$PATH

# 安装常用工具、创建 ll 命令（脚本 + alias）
RUN apk add --no-cache bash git build-base curl \
    && echo -e '#!/bin/sh\nls -alF "$@"' > /usr/local/bin/ll \
    && chmod +x /usr/local/bin/ll \
    && echo "alias ll='ls -alF'" >> /etc/profile.d/alias.sh

# 安装 air 工具
RUN go install github.com/air-verse/air@latest

# 设置默认工作目录
WORKDIR /go-work/src

# 容器对外暴露端口
EXPOSE 3000

# 保持容器运行（可根据实际需求修改为启动应用）
CMD ["tail", "-f", "/dev/null"]
