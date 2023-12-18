#!/bin/bash
source ../local.env

set -e

psql -v ON_ERROR_STOP=1 --username "$USER" --dbname "$DATABASE" <<-EOSQL
    CREATE USER $USER WITH PASSWORD '$PASSWORD';
    CREATE DATABASE $DATABASE;
    GRANT ALL PRIVILEGES ON DATABASE $DATBASE TO $USER;
EOSQL