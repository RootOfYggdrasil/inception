FROM alpine:3.16
# Accept arguments for the database
ARG DB_NAME \
    DB_USER \
    DB_PASS
# Install MariaDB
RUN apk update && apk add --no-cache mariadb mariadb-client
# Set up MariaDB configuration
RUN mkdir /var/run/mysqld; \
    chmod 777 /var/run/mysqld; \
    { echo '[mysqld]'; \
      echo 'skip-host-cache'; \
      echo 'skip-name-resolve'; \
      echo 'bind-address=0.0.0.0'; \
    } | tee  /etc/my.cnf.d/docker.cnf; \
    sed -i "s|skip-networking|skip-networking=0|g" \
      /etc/my.cnf.d/mariadb-server.cnf
# Initialize MariaDB
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
# Expose MariaDB port
EXPOSE 3306
# Copy and run the script to create the database and user
COPY tools/create_db.sh .
RUN sh create_db.sh && rm create_db.sh
# Switch to the mysql user
USER mysql
# Start MariaDB server
CMD ["/usr/bin/mysqld", "--skip-log-error"]