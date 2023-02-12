#!/bin/bash

sudo apt update -y

sudo apt install apache2 -y

sudo systemctl enable apache2
sudo systemctl start apache2 

sudo chown ubuntu:ubuntu -R /var/*

sudo echo "<html><h1> new private instance </h1></html>" > /var/www/html/index.html
