#!/bin/bash

echo "⏳ Restoring PostgreSQL..."
PGPASSWORD=devpass psql -U devuser -h localhost -p 5432 -d devdb < backup/postgres.sql

echo "⏳ Restoring MySQL..."
mysql -u devuser -pdevpass -h 127.0.0.1 devmysql < backup/mysql.sql

echo "⏳ Restoring MongoDB..."
mongorestore --host localhost --port 27017 --drop backup/mongo_dump

echo "✅ Restore complete."
