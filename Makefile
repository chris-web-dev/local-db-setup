db-up:
	docker-compose --env-file .env up -d

db-down:
	docker-compose down -v

db-postgres:
	docker-compose up -d postgres pgadmin

db-mssql:
	docker-compose up -d mssql adminer mssql-seed

db-mysql:
	docker-compose up -d mysql

db-mongo:
	docker-compose up -d mongo mongo-express

db-dbeaver:
	docker-compose up -d dbeaver

db-all:
	docker-compose up -d

db-seed-mssql:
	docker-compose run --rm mssql-seed

db-backup:
	bash backup/backup.sh

db-restore:
	bash backup/restore.sh