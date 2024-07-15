openssl req -newkey rsa:2048 -nodes -keyout ./srcs/requirements/tools/key.pem -x509 -days 365 -out ./srcs/requirements/tools/sdel-gra.42.fr.crt

#Review the created certificate:
openssl x509 -text -noout -in ./srcs/requirements/tools/sdel-gra.42.fr.crt


#Combine your key and certificate in a PKCS#12 (P12) bundle:
#openssl pkcs12 -inkey key.pem -in sdel-gra.42.fr.crt -export -out certificate.p12

#Validate your P2 file.
#openssl pkcs12 -in certificate.p12 -noout -info