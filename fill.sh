
#env setup
echo "DOMAIN_NAME=sdel-gra.42.fr" > $BASE_DIR/.env
echo "CERT_=./$TOOLS_DIR/sdel-gra.42.fr.crt" >> project/srcs/.env
echo "KEY_=./$TOOLS_DIR/sdel-gra.42.fr.key" >> project/srcs/.env
echo "DB_NAME=wordpress" >> $BASE_DIR/.env
echo "DB_ROOT=rootpass" >> $BASE_DIR/.env
echo "DB_USER=wpuser" >> $BASE_DIR/.env
echo "DB_PASS=wppass" >> $BASE_DIR/.env
