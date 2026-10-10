# get latest sha with commands:
# docker buildx imagetools inspect composer:latest
FROM composer:latest@sha256:4d71c3c2109c61d5415544264b59ad4087e4c5b7244481723664138fd36d5040 AS vendor
WORKDIR /vendor
RUN composer require dodo-it/entity-generator

# get latest sha with commands:
# docker buildx imagetools inspect php:8.5-cli-trixie
FROM php:8.5-cli-trixie@sha256:01a109229f4465bc9ef042d9198f09a4d9da7775a825dbd8572dcdbd8756c4d3

RUN docker-php-ext-install pdo pdo_mysql && docker-php-ext-enable pdo_mysql

WORKDIR /app

COPY index.php .
COPY --from=vendor vendor/ .

RUN mkdir entities
VOLUME /app/entities

ENV MYSQL_HOSTNAME=db
ENV MYSQL_DATABASE=database
ENV MYSQL_USERNAME=username
ENV MYSQL_PASSWORD=password
# ENV BASECLASS=
# ENV ENTITY_NAMESPACE=

SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["php", "index.php"]
CMD ["php", "index.php"]
