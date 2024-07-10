#!/bin/bash
#variable
BASE_DIR=srcs
REQUIREMENTS_DIR=$BASE_DIR/requirements
DB_DIR=$REQUIREMENTS_DIR/mariadb
NGINX_DIR=$REQUIREMENTS_DIR/nginx
WP_DIR=$REQUIREMENTS_DIR/wordpress
TOOLS_DIR=$REQUIREMENTS_DIR/tools

#base
mkdir $BASE_DIR
touch Makefile

#srcs
touch $BASE_DIR/docker-compose.yml
touch $BASE_DIR/.env
mkdir $BASE_DIR/requirements

#srcs/requirements dir
mkdir $REQUIREMENTS_DIR/bonus
mkdir $REQUIREMENTS_DIR/mariadb
mkdir $REQUIREMENTS_DIR/nginx
mkdir $REQUIREMENTS_DIR/tools
mkdir $REQUIREMENTS_DIR/wordpress


#srcs/requirements/mariadb
touch $DB_DIR/Dockerfile
touch $DB_DIR/.dockerignore
mkdir $DB_DIR/conf
mkdir $DB_DIR/tools

#MariaDB setup
echo ".git" > $DB_DIR/.dockerignore
echo ".env" >> $DB_DIR/.dockerignore

#srcs/requirements/nginx
touch $NGINX_DIR/Dockerfile
touch $NGINX_DIR/.dockerignore
mkdir $NGINX_DIR/conf
touch $NGINX_DIR/nginx.conf
mkdir $NGINX_DIR/tools
touch $NGINX_DIR/setup_nginx.sh

#nginx setup
echo ".git" > $NGINX_DIR/.dockerignore
echo ".env" >> $NGINX_DIR/.dockerignore

#srcs/requirements/wordpress
touch $WP_DIR/Dockerfile
touch $WP_DIR/.dockerignore
mkdir $WP_DIR/conf
mkdir $WP_DIR/tools

#wordpress setup
echo ".git" > $WP_DIR/.dockerignore
echo ".env" >> $WP_DIR/.dockerignore


#env setup
echo "DOMAIN_NAME=sdel-gra.42.fr" > $BASE_DIR/.env
echo "CERT_=./$TOOLS_DIR/sdel-gra.42.fr.emp" >> $BASE_DIR/.env
echo "KEY_=./$TOOLS_DIR/sdel-gra.42.fr.key" >> $BASE_DIR/.env
echo "DB_NAME=wordpress" >> $BASE_DIR/.env
echo "DB_ROOT=rootpass" >> $BASE_DIR/.env
echo "DB_USER=wpuser" >> $BASE_DIR/.env
echo "DB_PASS=wppass" >> $BASE_DIR/.env
