FROM	alpine:3.19.2
RUN		apk update && apk upgrade && apk add --no-cache nginx
EXPOSE	443

CMD		["nginx", "-g", "deamon off;"]