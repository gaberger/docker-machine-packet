#/bin/bash
for i in  $(docker-machine ls --format "{{.Name}}"); do
 eval $(docker-machine env $i)
 docker run  -p 80:80 --name nginx -d nginx 
 docker ps
done