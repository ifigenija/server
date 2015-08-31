#!/usr/bin/env bash

export APP_ENV=stage
./bin/util orm:schema-tool:drop --force --full-database
if [[ $1 != "--schema" ]]
then 
  ./bin/util dbal:run-sql "drop table migrations"
  ./bin/util migrations:migrate -n
else 
  ./bin/util orm:schema-tool:create
fi 
./bin/util populate
./bin/ifi user resetpass admin@ifigenija.si Admin1234
./bin/util populateTest



