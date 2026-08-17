ARG CLICKHOUSE_VERSION=25.8

FROM clickhouse/clickhouse-server:${CLICKHOUSE_VERSION}

COPY clickhouse/config.d/network.xml /etc/clickhouse-server/config.d/network.xml

EXPOSE 8123 9000 9009