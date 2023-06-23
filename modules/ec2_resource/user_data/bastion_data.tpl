#!/bin/bash

sudo apt-get update -y 
sudo apt-get curl nginx git -y

cat << EOF > heathstatus.js
var http = require("http");
http.createServer(function (request, response) {
   response.writeHead(200, {'Content-Type': 'text/plain'});   
   response.end('ok');
}).listen(80);
EOF