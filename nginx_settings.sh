#!/bin/bash
yum install nginx
service nginx start
curl -o nginx_settings.py https://raw.githubusercontent.com/anhaidgroup/tablebrowser/master/nginx_settings.py
chmod +x nginx_settings.py
./nginx_settings.py
service nginx restart
