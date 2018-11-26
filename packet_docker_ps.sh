#/bin/bash
for i in  $(docker-machine ls --format "{{.Name}}"); do
 eval $(docker-machine env $i)
 echo -n $i " "
 docker ps
done