#!/bin/sh
service mysql start
/bin/bash
mysql -u root </docker-entrypoint-initdb.d/CreateDatabase.sql
mysql -u root test </docker-entrypoint-initdb.d/CreateTable.sql
mysql -u root test </docker-entrypoint-initdb.d/CreateUser.sql
/usr/sbin/apache2ctl -D FOREGROUND
