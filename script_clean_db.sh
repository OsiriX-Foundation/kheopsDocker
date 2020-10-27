#!/bin/bash

docker exec -it kheopspostgres psql -Ukheopsuser kheops -c "SELECT * FROM albums"


