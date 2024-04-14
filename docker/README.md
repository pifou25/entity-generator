# Docker integration

## Entity Generator image
https://hub.docker.com/r/pifou25/entity-generator

## Example of generation

Starting from a plain flat SQL file, steps to generate PHP entities:

### Newtork creation
We first need to create a network to share the container hostname.
```
docker network create some-network
```

### start mysql or mariadb with the init SQL data
Now we run mysql on this network with the hostname, and with the SQL init data into ./init directory.
```
docker run --detach --rm --name some-mariadb -v $PWD/init:/docker-entrypoint-initdb.d --hostname some-mariadb --network some-network \
  --env MARIADB_USER=example-user \
  --env MARIADB_PASSWORD=my_cool_secret \
  --env MARIADB_DATABASE=exmple-database \
  --env MARIADB_ROOT_PASSWORD=my-secret-pw mariadb:latest
```

### start entity-generator image
Finally we generate every entities from the previous database into ./entities
```
docker run --rm -v $PWD/entities:/app/entities --network some-network \
   -e MYSQL_HOSTNAME=some-mariadb \
   -e MYSQL_DATABASE=exmple-database \
   -e MYSQL_USERNAME=example-user \
   -e MYSQL_PASSWORD=my_cool_secret \
    pifou25/entity-generator
```

### stop mysql server
cleaning
```
docker stop some-mariadb
docker network rm some-network
```
