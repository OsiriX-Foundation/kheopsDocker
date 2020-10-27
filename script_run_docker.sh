#!/bin/bash

cd kheops
docker-compose down -v
docker-compose up -d
cd ..


docker_name=("kheopsreverseproxy" "pacsauthorizationproxy" "kheopsauthorization" "pacsarc" "pacspostgres" "keycloak" "kheopsdicomwebproxy"\
            "kheopszipper" "kheopsui" "kheopspostgres" "ldap")

docker_logs=("" "" "" "" "" "" "" "" "" "" "")

while true;
do
   i=0
   flag=false
   for dn in "${docker_name[@]}"
   do
      old_log=${docker_logs[$i]}
      log=$(docker logs --tail 1 $dn)

      echo $log

      if [ "$old_log" == "$log" ]; then 
         docker_logs[i]=$log
      else
         docker_logs[i]=$log
         flag=true
      fi


      i=$((i+1))
   done

   if [ $flag = true ];
   then
      echo "waiting 10 secondes..."
      sleep 10
   else
    break
   fi
done

docker ps -a

node_modules/.bin/newman run postman/kheops-Get_tokens.json -e postman/kheops_localhost.postman_environment.json -g postman/Workspace.postman_globals.json --export-globals postman/Workspace.postman_globals.json
