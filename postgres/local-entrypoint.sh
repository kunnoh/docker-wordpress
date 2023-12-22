#!/bin/bash

# Load environment variables from file
if [ -f "./postgres.env" ]; then
    source ./postgres.env
else
    echo "Error: ./postgres.env not found."
    exit 1
fi

# Set an exit-on-error flag
set -e

# init the database cluster
initdb -D /var/lib/postgres/data -U postgres-admin

# internal start of server in order to allow set-up using psql-client
# does not listen on external TCP/IP and waits until start finishes
pg_ctl -D "/var/lib/postgres/data" -o "-c listen_addresses=''" -w start

sleep 5
# create a user or role
psql -v ON_ERROR_STOP=1 --username "$USER" --dbname "$DATABASE" <<-EOSQL
    CREATE USER $USER WITH PASSWORD '$PASSWORD';
    CREATE DATABASE $DATABASE;
    GRANT ALL PRIVILEGES ON DATABASE $DATABASE TO $USER;
EOSQL

# stop internal postgres server
pg_ctl -v ON_ERROR_STOP=1 -D "/var/lib/postgres/data" -m fast -w stop

exec "$@"