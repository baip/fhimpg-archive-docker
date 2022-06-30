#!/usr/bin/env bash

mkdir -p mysql
cp -a build/archive.sql mysql/
docker compose up -d
docker compose exec mysql bash -c 'mysql -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /var/lib/mysql/archive.sql'
rm -f mysql/archive.sql