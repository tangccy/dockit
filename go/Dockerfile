FROM golang:1.25-alpine

# 设置默认用户为 root
USER root

ENV GOPROXY=https://goproxy.cn,direct
ENV GOBIN=/usr/local/bin
ENV PATH=$PATH:$GOBIN:$PATH

# 安装 bash、git、编译工具、curl，并加 ll 别名
RUN apk add --no-cache bash git build-base curl \
    && echo "alias ll='ls -alF'" >> /root/.bashrc

RUN go install github.com/air-verse/air@latest

# 默认工作目录
WORKDIR /go-work/src
EXPOSE 3000

# 保持容器运行
CMD ["tail", "-f", "/dev/null"]
