#!bin/sh
if [ ! -d /var/log/mysql ]; then

    mkdir -p /var/log/mysql

fi

if [ ! -d /run/mysqld ]; then

    mkdir -p /run/mysqld

fi

#	First check if mysql exist
if [ ! -s "/var/run/mysqld/mysqld.sock" ]; then
		#change owner with flag recursive
        #chown -R mysql:mysql /var/lib/mysql
        echo "Initializing Mariadb"
        # init database
        mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm
fi



echo "CREATE DATABASE IF NOT EXISTS $mariadb_name ;" > InitializeDBUSER.sql
echo "CREATE USER IF NOT EXISTS '$mariadb_user'@'%' IDENTIFIED BY '$mariadb_password' ;" >> InitializeDBUSER.sql
echo "GRANT ALL PRIVILEGES ON $mariadb_name.* TO '$mariadb_user'@'%' ;" >> InitializeDBUSER.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> InitializeDBUSER.sql
echo "FLUSH PRIVILEGES;" >> InitializeDBUSER.sql

service mysql start

echo "Starting mariadb..... 10 sec required"
sleep 10

mysql < InitializeDBUSER.sql

sleep 2

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld

# chown -R mysql:mysql /var/log/mysql
# chown -R mysql:mysql /run/mysqld
# chown -R mysql:mysql /var/lib/mysql
# chown -R 777 /var/log/mysql
# chown -R 777 /var/lib/mysql





if [ ! -d "/var/lib/mysql/wordpress" ]; then

        cat << EOF > /tmp/create_db.sql
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM     mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';
CREATE DATABASE ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF
        # run init.sql
        /usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
        rm -f /tmp/create_db.sql
fi