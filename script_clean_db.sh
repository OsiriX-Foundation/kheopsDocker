#!/bin/bash

docker exec -it kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM event_series"
docker exec -it kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM events"
docker exec -it kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM report_providers"
docker exec -it kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM album_series"
docker exec -it kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM album_user"
docker exec -it kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM webhook_trigger_series"
docker exec -it kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM webhook_attempts"
docker exec -it kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM webhook_triggers"
docker exec -it kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM webhooks"
docker exec -it kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM capabilities"
docker exec -it kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM series"
docker exec -it kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM studies"
docker exec -it kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM users"
docker exec -it kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM albums"

node_modules/.bin/newman run postman/kheops-Get_tokens.json -e postman/kheops_localhost.postman_environment.json -g postman/Workspace.postman_globals.json --export-globals postman/Workspace.postman_globals.json
