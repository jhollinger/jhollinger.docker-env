#!/bin/bash

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE USER $CT_USER WITH ENCRYPTED PASSWORD '$CT_PASS';
  CREATE DATABASE $CT_USER;
  ALTER DATABASE $CT_USER OWNER TO $CT_USER;
  GRANT ALL PRIVILEGES ON DATABASE $CT_USER TO $CT_USER;
EOSQL

load_file=/docker-entrypoint-initdb.d/ct.sql.dump
if [ -f $load_file ]; then
  PGPASSWORD=$CT_PASS psql -v ON_ERROR_STOP=1 --username "$CT_USER" --dbname "$CT_USER" < $load_file
fi
