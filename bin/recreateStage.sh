#!/usr/bin/env bash

export APP_ENV=stage
./bin/util orm:schema-tool:drop --force
./bin/util dbal:run-sql "drop table migrations"
./bin/util migrations:migrate -n
./bin/util populate
./bin/ifi user resetpass admin@ifigenija.si Admin1234
./bin/util populateTest



