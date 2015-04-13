#!/bin/bash

pg_dump --host localhost --port 5432 --username "postgres" --password --format plain --no-owner --no-privileges --no-tablespaces --verbose --file "tests/_data/DumpFunctional.sql" "IfigenijaStage"

