#/bin/bash
for i in  $(docker-machine ls --format "{{.Name}}"); do
 eval $(docker-machine env $i)
 docker stop nginx
 docker rm nginx
done