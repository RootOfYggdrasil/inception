#!/bin/sh
service mariadb start 

cat << EOF > /tmp/create_db.sql
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';
CREATE DATABASE IF NOT EXISTS ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED by '${DB_PASS}';
FLUSH PRIVILEGES;
EOF
#echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > /tmp/create_db.sql
#echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' ;" >> /tmp/create_db.sql
#echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> /tmp/create_db.sql
#echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> /tmp/create_db.sql
#echo "FLUSH PRIVILEGES;" >> /tmp/create_db.sql

/usr/bin/mysqld --user=mysql --console --skip-name-resolve --skip-networking=0 < /tmp/create_db.sql
echo "CONTENT: $(cat /var/run/mysqld/mysqld.pid)"
#rm /tmp/create_db.sql
service mariadb stop 
# kill $(cat /var/run/mysqld/mysqld.pid)

mysqld