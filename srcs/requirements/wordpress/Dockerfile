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
RUN echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN echo "listen.owner = nobody" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN echo "listen.group = nobody" >> /etc/php/7.3/fpm/pool.d/www.conf
WORKDIR /var/www/html
CMD ["sh", "/script.sh" ]