#!/bin/bash

echo "Atualizando o servidor"
apt-get update && apt-get upgrade -y && apt-get install apache2 -y
echo "Criando site e hospedando"
cd /var/www/html/
echo "<html><head><title>Site Script</title></head><body><h1>Olá mundo!</h1></body></html>" > index.html

