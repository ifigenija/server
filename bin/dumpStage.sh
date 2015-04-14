#!/bin/bash

export PGPASSWORD=""        # nejasno zakaj deluje tudi z praznim geslom
pg_dump --host localhost --port 5432 --username "postgres"   --no-password      --format plain --no-owner --no-privileges --no-tablespaces --verbose --file "tests/_data/DumpFunctional.sql" "IfigenijaStage"

