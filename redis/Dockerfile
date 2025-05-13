# 使用官方 Redis 镜像作为基础镜像
FROM redis:latest

# 暴露 Redis 默认端口 6379
EXPOSE 6379

# 设置工作目录
VOLUME ["/data"]

# 复制本地的 redis.conf 文件到容器中的配置目录
COPY redis.conf /etc/redis/redis.conf

# 启动 Redis 并指定配置文件
CMD ["redis-server", "/etc/redis/redis.conf"]
