# 使用官方 Consul 镜像作为基础镜像
FROM consul:1.15

# 暴露 Consul 的端口
EXPOSE 8500 8600/udp

# 设置容器启动时的命令
CMD ["agent", "-dev", "-client=0.0.0.0"]
