#!/bin/bash

sudo yum install epel-release  
sudo yum update  -y
sudo yum install -y nginx  git
sudo systemctl enable nginx
nginx -v

sudo mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf_orig 

curl https://github.com/Stonnystone/devops_aws_ci_lab/blob/main/lab_01/solution/nginx.conf > nginx_config
sudo cp nginx_config /etc/nginx/nginx.conf
sudo nginx -t
sudo systemctl restart nginx

cat << EOF > heathstatus.js
cat << EOF > heathstatus.js
var http = require("http");
http.createServer(function (request, response) {
   response.writeHead(200, {'Content-Type': 'text/plain'});   
   response.end('ok');
}).listen(80);
EOF

