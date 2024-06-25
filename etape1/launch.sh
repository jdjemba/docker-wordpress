#!/bin/bash

# Créeer le réseau nécessaire a la mise en communication des deux conteneurs
docker network create reseau 

# créeer et lancer le conteneur php auquel on a fourni le code soruce des fichiers nécessaires
docker container run -d --network reseau --name script -v $(pwd)/source:/app  php:8.3.7-fpm 

# créer et lancer le conteneur nginx qu'on a reconfiguré et dans lequel on a ajouté les codes sources
docker container run -p 8080:80 -d --name http -v $(pwd)/source:/app -v $(pwd)/config/default.conf:/etc/nginx/conf.d/default.conf --network reseau nginx:1.25

