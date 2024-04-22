# Docker integration

## Entity Generator image

![Docker Pulls](https://img.shields.io/docker/pulls/pifou25/entity-generator)
 https://hub.docker.com/r/pifou25/entity-generator

## Generation from existing database
The database should be accessible from the docker network, the hostname is either
the name of the Mysql running container, or `localhost` if db is running on host.
The below command will generate entities into `./entities` directory.

```
docker run --rm -v $PWD/entities:/app/entities --network some-network \
   -e MYSQL_HOSTNAME=some-mariadb \
   -e MYSQL_DATABASE=exmple-database \
   -e MYSQL_USERNAME=example-user \
   -e MYSQL_PASSWORD=my_cool_secret \
    pifou25/entity-generator
```

## namespace and extends example
The base class must exist into /entities to be declared
```
docker run --rm -v $PWD/include/entities:/app/entities --network scripts_default \
   -e MYSQL_HOSTNAME=myhost \
   -e MYSQL_DATABASE=mydb \
   -e MYSQL_USERNAME=myuser \
   -e MYSQL_PASSWORD=mypwd \
   -e ENTITY_NAMESPACE=Example\\Pdo\\Entities \
   -e BASECLASS=Example\\Pdo\\Entities\Entity \
    entity-generator
```

## Generation from flat plain SQL file

The `docker compose` file create a new database and initialize it with SQL data,
you have to put SQL init file into `./init` directory. When db is ready, 
 the entity-generator start on it to generate PHP entities.

It is as simple as running this command from your working directory :
`docker compose up`

