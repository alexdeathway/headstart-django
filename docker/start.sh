#!/bin/bash

cd /app

if [ $# -eq 0 ]; then
    echo "Usage: start.sh [PROCESS_TYPE](server)"
    exit 1
fi

PROCESS_TYPE=$1

if [ "$PROCESS_TYPE" = "server" ]; then
    if [ "$DEBUG" = "True" ]; then
        echo ""
        echo "........................................Starting in DEBUG Mode......................................................."
        echo ""
        python manage.py runserver \
            0.0.0.0:8000
    else
        echo ""
        echo "......................................Starting in PRODUCTION Mode..................................................."
        echo ""
        gunicorn \
            --bind 0.0.0.0:8000 \
            --workers 2 \
            --worker-class gthread \
            --log-level DEBUG \
            --access-logfile "-" \
            --error-logfile "-" \
            core.wsgi | tee "$GUNICORN_LOG_FILE"
    fi
fi
