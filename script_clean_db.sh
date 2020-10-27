#!/bin/bash

docker exec -it kheopspostgres psql -Ukheopsuser kheops -c "SELECT * FROM albums"

docker exec -it kheopspostgres pg_dump -U kheopsuser -v -Fc -s -f kheops.dump kheops
docker exec -it kheopspostgres dropdb -U kheopsuser kheops
docker exec -it kheopspostgres createdb -U kheopsuser kheops
docker exec -it kheopspostgres pg_restore -U kheopsuser -v -d kheops kheops.dump

docker exec -it kheopspostgres psql -Ukheopsuser kheops -c "SELECT * FROM albums"
