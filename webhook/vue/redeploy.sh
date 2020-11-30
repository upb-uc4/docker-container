#!/bin/sh

echo "Redeploying ui-web"
docker stop ui-web
docker rm ui-web
docker rmi uc4official/ui-web:latest
docker pull uc4official/ui-web:latest
docker run -d -p 8080:80 --name ui-web uc4official/ui-web:latest nginx -g 'daemon off;'