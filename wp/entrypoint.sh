#!/bin/bash

# Check if MySQL is up and running
while ! mysqladmin ping -h"$WORDPRESS_DB_HOST" -u"$WORDPRESS_DB_USER" -p"$WORDPRESS_DB_PASSWORD" --silent; do
  echo "MySQL is unavailable - sleeping"
  sleep 1
done

# OR Check if PostgreSQL is up and running
while ! pg_isready -h"$PGHOST" -U"$POSTGRES_USER" -d"$POSTGRES_DB"; do
  echo "PostgreSQL is unavailable - sleeping"
  sleep 1
done

echo "Databases are up - starting WordPress"
exec "$@"
