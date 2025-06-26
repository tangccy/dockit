# 使用 Alpine 版本的 PHP 作为基础镜像
FROM php:8.2-fpm-alpine

# 替换 apk 源为阿里云，加快速度
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

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
    bash \
    oniguruma-dev \
    libzip-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev

# 安装 gd 扩展
RUN docker-php-ext-configure gd \
        --with-freetype \
        --with-jpeg \
    && docker-php-ext-install gd

# 安装 sockets、fileinfo、pcntl 等常用扩展
RUN docker-php-ext-install sockets fileinfo pcntl pdo_mysql mbstring zip bcmath

# 安装 PECL 扩展（自动生成 ini 配置）
RUN pecl install redis mongodb xlswriter protobuf && docker-php-ext-enable redis mongodb protobuf xlswriter

# 安装 swoole
RUN pecl install swoole \
    && docker-php-ext-enable swoole \
    && echo "swoole.use_shortname=Off" > /usr/local/etc/php/conf.d/docker-swoole.ini



RUN apk add --no-cache nodejs npm && npm install -g pnpm

# 清理构建依赖，减小体积
RUN apk del .build-deps

# 设置工作目录
WORKDIR /var/www

# 安装 Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 拷贝配置文件（你已有的）
COPY php.ini /usr/local/etc/php/

# 暴露端口
EXPOSE 9000

# 启动
CMD ["php-fpm"]
