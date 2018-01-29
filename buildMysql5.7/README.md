# MariaDB 10.2 (MySQL 5.7) Docker image on Alpine Linux

## Docker image usage

```
docker run [docker-options] pickapp/mariadb-alpine
```

Note that MySQL root password will be randomly generated (using pwgen).
Root password will be displayed, during first run using output similar to this:
```
[i] MySQL root Password: XXXXXXXXXXXXXXX
```

But you don't need root password. If you connect locally, it should not
ask you for a password, so you can use following procedure:
```
docker exec -ti mariadb_containerid /bin/sh
# mysql -u root mysql
```
This way you can add any user as well.

## Examples

Typical usage:

```
docker run -ti -v /host/dir/for/db:/var/lib/mysql -e MYSQL_DATABASE=db -e MYSQL_USER=user -e MYSQL_PASSWORD=blah k0st/alpine-mariadb
```

## Configuration

## My.cnf overrides

You can override default MariaDB (MySQL) configuration settings by mounting a volume pointing to /etc/mysql/conf.d .
All files in this directory will be included and all configurations in them will be overriden (in order).

### Init scripts

You can create init scripts by mounting a volume into
- /opt/mariadb/pre-init.d : All .sh scripts in this directory will be executed before 1st time initialization (database creation)
- /opt/mariadb/post-init.d : All .sh scripts in this directory will be executed after 1st time initialization (database creation)
- /opt/mariadb/pre-exec.d : All .sh scripts in this directory will be executed before every start of MariaDB server

## Notes

- No TokuDB is compiled because it has GLIBC dependencies
- Partition and blackhole storage engines are loadable dynamic plugins
- It has OQGraph storage engine as well for graph computing
