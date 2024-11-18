
docker build -t nginxprueba1 .

docker images

docker run  -p 8000:80 nginxprueba1:latest

docker run -d -p 8000:80 -p 443:443 nginxprueba1:latest

docker rmi nginxprueba1:latest

docker rmi nginxprueba1:latest --force

docker rmi f497

docker rmi 6c74 --force 

docker exec -it eager_cray bash

cat /etc/nginx/.htpasswd 

docker exec -it eager_cray nginx -t

ls -l /etc/nginx/ssl 
total 8
-rw-r--r-- 1 root root 1249 Nov 16 16:53 server.crt
-rw------- 1 root root 1708 Nov 16 16:53 server.key

docker restart eager_cray

& "C:\Program Files\Google\Chrome\Application\chrome.exe" --incognito --host-resolver-rules="MAP serverwebdaw localhost" --ignore-certificate-errors

google-chrome --incognito --host-resolver-rules="MAP serverwebdaw localhost" --ignore-certificate-errors

docker run -d -p 80:80 -p 443:443 serverdocker

docker login

docker tag serverdocker:latest eduardgabriel/serverdocker:latest

docker push eduardgabriel/serverdocker:latest

docker image inspect eduardgabriel/serverdocker:latest

docker run -d -p 80:80 -p 443:443 eduardgabriel/serverdocker:latest
