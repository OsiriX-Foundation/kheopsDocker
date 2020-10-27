#!/bin/bash

psql -Ukheopsuser -W mypwd -d kheops -c "SELECT * FROM albums"


