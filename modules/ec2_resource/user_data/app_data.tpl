#!/bin/bash

sudo apt-get update -y &&
sudo apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common &&
curl nginx git

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

sudo apt get-install docker-ce docker-ce-cli containerd.io -y &&
sudo usermod -aG docker  ${USER}


cat << EOF > Dockerfile
FROM node:18-alpine
WORKDIR /app
COPY . .
EXPOSE 3000
CMD ["node", "main.js"]
EOF

 
cat << EOF > main.js
var http = require('http');
const os = require('os');

const port = process.env.PORT || 3000;
const hostname = os.hostname();

http.createServer(onRequest).listen(port);
console.log('Server has started');

function onRequest(request, response){
  const host = request.socket.localAddress;
  response.writeHead(200, {'Content-Type': 'text/html'});
  response.write("Hi there! I'm being served from" + os.hostname());
  response.end();
}
EOF

DATE=`date +%Y.%m.%d.%H.%M`
IMG_NAME=`demo-app`
 
echo "build the docker image"
sudo docker build -t $IMG_NAME:$DATE . >> output

echo "Deploying the updated container"
sudo docker run -itd -p 3000:3000 --name $IMG_NAME $OUTPUT
echo "Deploying the container"


cat << EOF > heathstatus.js
cat << EOF > heathstatus.js
var http = require("http");
http.createServer(function (request, response) {
   response.writeHead(200, {'Content-Type': 'text/plain'});   
   response.end('ok');
}).listen(80);
EOF

