#/bin/bash
for i in  $(docker-machine ls --format "{{.Name}}"); do
	docker-machine inspect $i  --format "{{.Driver.IPAddress}}"
done