#!/bin/bash

pg_dump --host localhost --port 5432 --username "ifi" --no-password  --format plain --no-owner --no-privileges --no-tablespaces --verbose --file "tests/_data/DumpFunctional.sql" "IfiStage"
