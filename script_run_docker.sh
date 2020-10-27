#!/bin/bash

cd kheops
docker-compose down -v
docker-compose up -d
cd ..

./script_wait_docker_start > /dev/null

docker ps -a

node_modules/.bin/newman run postman/kheops-Get_tokens.json -e postman/kheops_localhost.postman_environment.json -g postman/Workspace.postman_globals.json --export-globals postman/Workspace.postman_globals.json
