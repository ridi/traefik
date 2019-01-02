cd /pem

KEY=`ls | grep -e \-key.pem | head -n1`
CRT=`ls | grep -v -e \-key.pem | head -n1`

openssl rsa -in $KEY -out /ssl/traefik.key
openssl x509 -inform PEM -in $CRT -out /ssl/traefik.crt
