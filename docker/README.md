# Docker integration

## Entity Generator image
https://hub.docker.com/r/pifou25/entity-generator

## Example of generation

Starting from a plain flat SQL file, steps to generate PHP entities:
### start mysql or mariadb with the init SQL data
```
docker run --detach --rm --name some-mariadb -v $PWD/init:/docker-entrypoint-initdb.d \
  --env MARIADB_USER=example-user \
  --env MARIADB_PASSWORD=my_cool_secret \
  --env MARIADB_DATABASE=exmple-database \
  --env MARIADB_ROOT_PASSWORD=my-secret-pw mariadb:latest
```

### start entity-generator image
```
docker run --detach --rm -v $PWD/entities:/app/entities \
   -e MYSQL_HOSTNAME=some-mariadb \
   -e MYSQL_DATABASE=exmple-database \
   -e MYSQL_USERNAME=example-user \
   -e MYSQL_PASSWORD=my-secret-pw \
    pifou25/entity-generator
```

### stop mysql server
```
docker stop some-mariadb
```
