#!/bin/bash

cd kheops
docker-compose down -v
docker-compose up -d
cd ..


docker_name=("kheopsreverseproxy" "pacsauthorizationproxy" "kheopsauthorization" "pacsarc" "pacspostgres" "keycloak" "kheopsdicomwebproxy"\
            "kheopszipper" "kheopsui" "kheopspostgres" "ldap")

#docker_logs[11]

while true;
do
   for dn in "${docker_name[@]}"
   do
      docker logs --tail 1 $dn
   done
   break
done



sleep 60

docker ps -a

node_modules/.bin/newman run postman/kheops-Get_tokens.json -e postman/kheops_localhost.postman_environment.json -g postman/Workspace.postman_globals.json --export-globals postman/Workspace.postman_globals.json
