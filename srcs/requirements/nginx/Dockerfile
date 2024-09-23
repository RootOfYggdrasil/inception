FROM	alpine:3.16
RUN		apk update && apk upgrade && apk add --no-cache nginx
EXPOSE	443

COPY ./conf/nginx.conf /etc/nginx/http.d/nginx.conf

COPY	./tools/sdel-gra.42.fr.crt /etc/nginx/ssl/sdel-gra.42.fr.crt
COPY	./tools/sdel-gra.42.fr.key /etc/nginx/ssl/sdel-gra.42.fr.key
COPY	./nginx_start.sh /nginx_start.sh
# RUN		chmod +x /nginx_start.sh

CMD		["nginx", "-g", "daemon off;"]
# CMD		["sh", "/nginx_start.sh"]