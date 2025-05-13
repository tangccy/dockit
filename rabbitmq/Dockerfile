FROM rabbitmq:3.13-management

# 启用额外插件（如需要）
RUN rabbitmq-plugins enable --offline rabbitmq_mqtt rabbitmq_web_mqtt

# 可选：拷贝配置文件（如有）
COPY rabbitmq.conf /etc/rabbitmq/rabbitmq.conf