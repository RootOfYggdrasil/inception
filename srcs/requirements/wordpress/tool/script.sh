
# create directory to use in nginx container later and also to setup the wordpress conf
mkdir -p /var/www/html

cd /var/www/html

if [ ! -f /var/www/html/wp-config.php ]; then
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
mv /wp-config.php /var/www/html/wp-config.php
sed -i -r "s/database_name_here/$DB_NAME/1"   wp-config.php
sed -i -r "s/username_here/$DB_USER/1"  wp-config.php
sed -i -r "s/password_here/$DB_PASS/1"    wp-config.php

wp core install --url=$DOMAIN_NAME/ --title="$WP_TITLE" --admin_user=$ADM_WP_NAME --admin_password=$ADM_WP_PASS --admin_email=$ADM_WP_EMAIL --skip-email --allow-root

wp user create $WP_USERNAME $WP_USEREMAIL --role=author --user_pass=$WP_USERPASS --allow-root
fi
#wp theme install astra --activate --allow-root
#wp plugin install redis-cache --activate --allow-root
#wp plugin update --all --allow-root
/usr/sbin/php-fpm7.3 -F