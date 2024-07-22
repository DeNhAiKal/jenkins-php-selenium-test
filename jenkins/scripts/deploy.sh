#!/usr/bin/env sh
set -x
docker rm -f my-apache-php-app || true
docker run -d -p 80:80 --name my-apache-php-app -v C:\Users\denpe\Documents\Github\jenkins-php-selenium-test\\src:/var/www/html php:7.2-apache
sleep 5
CONTAINER_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' my-apache-php-app)
set +x
echo "Application is running at http://${CONTAINER_IP}"