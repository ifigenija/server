#!/bin/bash
#
# Local File Override
# 
# This  file is for overriding environment-specific and security-sensitive configuration information.
# Copy this file without the .dist extension at the end and populate values as needed.
# 

# zamenjaj parametre:
#    --username "<username>"  ,npr. "ifi"
#    "<dbase_name>"           ,npr. "IfigenijaStage"

psql --host localhost --port 5432 --username "ifi" "IfiStage" < "tests/_data/DumpFunctional.sql" 

