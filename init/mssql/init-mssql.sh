#!/bin/bash

echo "⏳ Waiting for SQL Server to be ready..."

# Wait until MSSQL is ready
until /opt/mssql-tools/bin/sqlcmd -S local-mssql -U sa -P "$MSSQL_SA_PASSWORD" -Q "SELECT 1" &> /dev/null
do
  sleep 2
done

echo "✅ SQL Server is ready. Running seed..."

# Run the seed SQL
/opt/mssql-tools/bin/sqlcmd -S local-mssql -U sa -P "$MSSQL_SA_PASSWORD" -i /seed/seed.sql

echo "✅ Seeding complete."
