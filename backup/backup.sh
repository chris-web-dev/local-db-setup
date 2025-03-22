#!/bin/bash

echo "🔄 Backing up PostgreSQL..."
PGPASSWORD=devpass pg_dump -U devuser -h localhost -p 5432 devdb > backup/postgres.sql

echo "🔄 Backing up MySQL..."
mysqldump -u devuser -pdevpass -h 127.0.0.1 devmysql > backup/mysql.sql

echo "🔄 Backing up MongoDB..."
mongodump --host localhost --port 27017 --out=backup/mongo_dump

echo "✅ Backups completed in ./backup"
