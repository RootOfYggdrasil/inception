FROM debian:buster


RUN apt update -y 
RUN apt install php-fpm -y php-mysql \
    curl


COPY ./tools/script.sh /
COPY ./conf/wp-config.php /


CMD [ "/script.sh" ]