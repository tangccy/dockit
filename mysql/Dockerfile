# 使用官方 MySQL 8.0 镜像作为基础镜像
FROM mysql:8.0

# 如果有其他配置文件需要拷贝到容器，可以在这里添加
COPY my.cnf /etc/my.cnf

# 你可以在这里添加其他自定义的 MySQL 配置
# 例如：RUN mysql -u root -e "CREATE DATABASE ...;"

# 暴露 MySQL 的默认端口 3306
EXPOSE 3306

# 持久化数据的路径
VOLUME ["/var/lib/mysql"]
