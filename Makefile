db-up:
	docker-compose --env-file .env up -d

db-down:
	docker-compose down -v

db-restart:
	make db-down && make db-up

db-postgres:
	docker-compose --env-file .env up -d postgres pgadmin

db-mssql:
	docker-compose --env-file .env up -d mssql adminer

db-mysql:
	docker-compose --env-file .env up -d mysql

db-mongo:
	docker-compose --env-file .env up -d mongo mongo-express
