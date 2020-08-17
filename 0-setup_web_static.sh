#!/usr/bin/env bash
#sets up a web server for deployment of web_static
apt -y update
apt install -y nginx
mkdir -pv /data/web_static/releases/test/
mkdir -pv /data/web_static/shared/
echo "Holberton School" > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current
chown -hR ubuntu:ubuntu /data/
echo "
server {
  listen 80;
  listen [::]:80 default_server;
  location /hbnb_static {
    alias /data/web_static/current/;
  }
  index index.html;

  server_name koeusiss.tech;
  rewrite '^/redirect_me$' http://example.com permanent;
  error_page 404 /custom_404.html;
  add_header X-Served-By $HOSTNAME;
}" > /etc/nginx/sites-available/default
service nginx restart
