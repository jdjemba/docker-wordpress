#!/bin/bash

# Étape 2
Docker build -t php-mysql .

# Créer le réseau de l'étape 1
docker run -d --network reseau --name script -v $(pwd):/app --rm php-mysql

# Créer le conteneur Nginx de l'étape 1
docker run -p 8080:80 -d --name http -v $(pwd):/app --rm -v $(pwd)/conf/default.conf:/etc/nginx/conf.d/default.conf --network reseau nginx:1.25

# Créer le conteneur MySQL
docker run --name data --network reseau -e MYSQL_ROOT_PASSWORD=root -e MYSQL_PASSWORD=test -e MYSQL_DATABASE=mydatabase -e MYSQL_USER=test -p 3306:3306 -d mysql
