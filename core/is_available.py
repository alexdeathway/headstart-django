import sys
import os
from psycopg2 import connect
from psycopg2.errors import OperationalError
from dotenv import load_dotenv
load_dotenv()

def postgres_connection():
    try:
        connect(
            host=os.environ.get("POSTGRES_HOST"),
            port=os.environ.get("POSTGRES_PORT"),
            user=os.environ.get("POSTGRES_USER"),
            password=os.environ.get("POSTGRES_PASSWORD"),
            dbname=os.environ.get("POSTGRES_DATABASE"),
        )
        print("PostgreSQL is available!")
        return True
    except OperationalError:
        print("PostgreSQL is not available!")
        return False