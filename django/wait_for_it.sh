#!/bin/sh
# Waits for postgresql service to be reachable

until psql -h "postgresql" -U "postgres" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping 3"
  sleep 3
done

>&2 echo "Postgres is up - executing command"
