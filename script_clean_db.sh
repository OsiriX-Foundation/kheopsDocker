#!/bin/bash

docker exec -i kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM event_series" > /dev/null
docker exec -i kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM events" > /dev/null
docker exec -i kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM report_providers" > /dev/null
docker exec -i kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM album_series" > /dev/null
docker exec -i kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM album_user" > /dev/null
docker exec -i kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM webhook_trigger_series" > /dev/null
docker exec -i kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM webhook_attempts" > /dev/null
docker exec -i kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM webhook_triggers" > /dev/null
docker exec -i kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM webhooks" > /dev/null
docker exec -i kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM capabilities" > /dev/null
docker exec -i kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM series" > /dev/null
docker exec -i kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM studies" > /dev/null
docker exec -i kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM users" > /dev/null
docker exec -i kheopspostgres psql -Ukheopsuser kheops -c "DELETE FROM albums" > /dev/null
