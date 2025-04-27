# 使用 Alpine 版本的 PHP 作为基础镜像
FROM php:8.2-fpm-alpine

# 安装系统依赖（编译和运行都需要的）
RUN apk add --no-cache --virtual .build-deps \
    autoconf \
    gcc \
    g++ \
    make \
    openssl-dev \
    pcre-dev \
    zlib-dev \
    linux-headers \
    curl-dev \
    libxml2-dev \
    libtool \
    protobuf-dev \
    nghttp2-dev \
    && apk add --no-cache \
    git \
    unzip \
    curl \
    wget \
    supervisor \
    bash \
    oniguruma-dev \
    libzip-dev


# 安装 sockets、fileinfo、pcntl 等常用扩展
RUN docker-php-ext-install sockets fileinfo pcntl pdo_mysql mbstring zip bcmath

# 安装 PECL 扩展（自动生成 ini 配置）
RUN pecl install redis mongodb protobuf && docker-php-ext-enable redis mongodb protobuf

# 手动下载、编译、启用 swoole（来源是 pecl 包，不需要写 ini 文件）
RUN pecl download swoole \
    && tar -xf swoole-*.tgz && cd swoole-* \
    && phpize \
    && ./configure --enable-openssl --enable-http2 --enable-sockets \
    && make -j$(nproc) && make install \
    && docker-php-ext-enable swoole \
    && cd .. && rm -rf swoole-* swoole-*.tgz

# 清理构建依赖，减小体积
RUN apk del .build-deps

# 设置工作目录
WORKDIR /var/www

# 安装 Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 拷贝配置文件（你已有的）
COPY php/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY php/php.ini /usr/local/etc/php/

# 暴露端口
EXPOSE 9000

# 启动 supervisord
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
