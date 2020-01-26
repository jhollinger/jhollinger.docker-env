#!/bin/bash

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE USER $CT_USER WITH
    ENCRYPTED PASSWORD '$CT_PASS'
    CREATEDB;
EOSQL
