#!/bin/bash

sudo apt update -y
sudo apt install apache2 -y
HOST=$(hostname) 
echo "<hmtl><h1> google compute instance $(echo $HOST) </h1></html>" > /var/www/html/index.html
curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
sudo bash add-google-cloud-ops-agent-repo.sh --also-install

