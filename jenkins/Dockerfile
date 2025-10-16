# Dockerfile
FROM jenkins/jenkins:latest

USER root

# 安装 Docker CLI，用于在 Jenkins 内执行 docker 命令
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && apt-get install -y docker-ce-cli && \
    apt-get clean

# 安装一些常用工具（可选）
RUN apt-get install -y git zip unzip vim && apt-get clean

RUN jenkins-plugin-cli --plugins "blueocean docker-workflow git"

# 安装 docker-compose
RUN curl -L "https://github.com/docker/compose/releases/download/v2.30.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# 切换回 Jenkins 用户
USER jenkins

# 默认暴露 8080 (Web) 和 50000 (agent)
EXPOSE 8080 50000
