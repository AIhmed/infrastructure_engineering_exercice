#!/bin/bash

sudo apt update -y
sudo apt install apache2 -y
echo "<hmtl><h1> google compute instance try 2 </h1></html>" > /var/www/html/index.html
