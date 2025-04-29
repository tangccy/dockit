FROM golang:1.24-alpine


ENV GOBIN=/usr/local/bin

# 安装 Air（热重载工具），安装到/usr/local/bin里面
RUN go install github.com/air-verse/air@latest

# 设置开发默认的 GOPATH
ENV GOPATH=/go
ENV PATH=$PATH:$GOPATH/bin

WORKDIR $GOPATH/src

EXPOSE 3000

# 使用 air 启动项目
CMD ["air"]
#CMD ["tail", "-f", "/dev/null"]