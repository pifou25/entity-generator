FROM ghcr.io/symfony-cli/symfony-cli:5.8.15 AS symfony

FROM php:8.2-cli-bookworm

RUN apt-get update && \
   apt-get -y  --no-install-recommends install git unzip \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/*

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN docker-php-ext-install pdo pdo_mysql && docker-php-ext-enable pdo_mysql

SHELL ["/bin/bash", "-eo", "pipefail", "-c"]
COPY --from=symfony /usr/local/bin/symfony /usr/local/bin/symfony
# RUN curl -sS https://get.symfony.com/cli/installer | bash
# RUN mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

WORKDIR /app
RUN composer require dodo-it/entity-generator

COPY index.php .
RUN mkdir entities && chmod +x index.php
VOLUME /app/entities

ENV MYSQL_HOSTNAME=db
ENV MYSQL_DATABASE=database
ENV MYSQL_USERNAME=username
ENV MYSQL_PASSWORD=password

CMD php index.php --hostname $MYSQL_HOSTNAME --database $MYSQL_DATABASE --username $MYSQL_USERNAME --password $MYSQL_PASSWORD
