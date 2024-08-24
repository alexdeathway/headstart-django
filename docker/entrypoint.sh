#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

postgres_ready() {
    python << END
import sys

from psycopg import connect
from psycopg.errors import OperationalError

try:
    connect(
        dbname="${POSTGRES_DATABASE}",
        user="${POSTGRES_USER}",
        password="${POSTGRES_PASSWORD}",
        host="${POSTGRES_HOST}",
        port="${POSTGRES_PORT}",
    )
except OperationalError:
    sys.exit(-1)
END
}

until postgres_ready; do
  >&2 echo "Waiting for PostgreSQL to become available..."
  sleep 5
done
>&2 echo "PostgreSQL is available"

python3 manage.py collectstatic --noinput
python3 manage.py makemigrations
python manage.py migrate

if [[ "$DEBUG" == "True" ]]; then
  if [ -f "db.json" ]; then
    echo "Loading dummy database..."
    python3 manage.py loaddata db.json
  else
    echo "looks like there is no dummy database or fixture to load..."
  fi
else
  echo "This is not a drill...."
fi

exec "$@"
