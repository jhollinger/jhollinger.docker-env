#!/bin/bash

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE USER $CUR8_USER WITH
    ENCRYPTED PASSWORD '$CUR8_PASS'
    CREATEDB;
EOSQL
