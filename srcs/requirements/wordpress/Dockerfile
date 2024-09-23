FROM debian:buster


RUN apt update -y 
RUN apt-get update && apt-get install -y php-mysql \
	php-fpm \
	php \
    mariadb-client \
	curl
RUN mkdir -p /run/php
EXPOSE 9000

COPY ./tool/script.sh /
COPY ./conf/wp-config.php /
RUN chmod +x ./script.sh
RUN chmod 777 ./script.sh
WORKDIR /var/www/html
CMD ["sh", "/script.sh" ]