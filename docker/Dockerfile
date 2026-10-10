# get latest sha with commands:
# docker buildx imagetools inspect composer:latest
FROM composer:latest@sha256:af98f42dfff7c68ba8d53c2164fd9fde1087b7d449514baa38c418b1f6bc4bac AS vendor
WORKDIR /vendor
RUN composer require dodo-it/entity-generator

# get latest sha with commands:
# docker buildx imagetools inspect php:8.5-cli-trixie
FROM php:8.5-cli-trixie@sha256:54d82ff9be6bd198145e90c917fc9b2e24230b42e52def8deb3554baf61c451a

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
