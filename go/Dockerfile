FROM golang:1.24-alpine

# 安装 Air（热重载工具）
RUN go install github.com/air-verse/air@latest

# 设置 GOPATH
ENV GOPATH=/go

# 设置 rootpath
ENV ROOTPATH=/go/src

WORKDIR $ROOTPATH

EXPOSE 3000

# 使用 air 启动项目
CMD ["air"]
