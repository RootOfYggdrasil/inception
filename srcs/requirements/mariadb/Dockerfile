FROM alpine:3.16

ARG DB_NAME \
    DB_USER \
    DB_PASS

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY ./requirements/mariadb/conf/mariadb.cnf /etc/my.cnf.d/mariadb.cnf


RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

COPY requirements/mariadb/tools/db_initialize.sh .
RUN sh db_initialize.sh && rm db_initialize.sh
CMD ["/usr/bin/mysqld", "--skip-log-error"]