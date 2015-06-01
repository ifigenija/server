#!/usr/bin/env bash

export APP_ENV=stage
./bin/util orm:schema-tool:drop --force
./bin/util orm:schema-tool:create
./bin/util populate
./bin/util populateTest
./bin/ifi user resetpass admin@ifigenija.si Admin1234



