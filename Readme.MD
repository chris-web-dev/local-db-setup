# 🛠️ local-db-setup

Local development environment with **PostgreSQL**, **Microsoft SQL Server**, and browser-based UI tools using Docker Compose.

---

## 📦 Services

| Service   | Description                   | Port       |
|-----------|-------------------------------|------------|
| PostgreSQL | Relational database            | `5432`     |
| SQL Server | Microsoft SQL Server 2022      | `1433`     |
| pgAdmin    | Web UI for PostgreSQL          | `8082`     |
| Adminer    | Web UI for SQL Server (light)  | `8081`     |

---

## 🚀 Getting Started

### 1. Clone this Repo

```bash
git clone https://github.com/your-username/local-db-setup.git
cd local-db-setup
```

### 2. Create the `.env` File

```env
# PostgreSQL
POSTGRES_USER=devuser
POSTGRES_PASSWORD=devpass
POSTGRES_DB=devdb

# SQL Server
MSSQL_SA_PASSWORD=YourStrong!Passw0rd
MSSQL_DB=devsqldb

# pgAdmin
PGADMIN_DEFAULT_EMAIL=admin@local.dev
PGADMIN_DEFAULT_PASSWORD=admin123
```

> The `.env` file must be in the root of the project next to `docker-compose.yml`.

---

### 3. Start the Stack

```bash
docker-compose --env-file .env up -d
```

Using npm:

```bash

npm run db:postgres     # Start PostgreSQL + pgAdmin
npm run db:mssql        # Start SQL Server + Adminer
npm run db:mysql        # Start MySQL only
npm run db:mongo        # Start MongoDB + Mongo Express
npm run db:up           # Start everything
npm run db:down         # Stop all and remove volumes
Or using Makefile (if installed):

```bash

make db-postgres
make db-mongo
make db-down
```
---

### 4. Access Tools

- **pgAdmin**: [http://localhost:8082](http://localhost:8082)  
  - Email: `admin@local.dev`  
  - Password: `admin123`  
  - **Host when adding server**: `postgres`

- **Adminer**: [http://localhost:8081](http://localhost:8081)  
  - System: `Microsoft SQL Server`  
  - Server: `mssql`  
  - Username: `sa`  
  - Password: `YourStrong!Passw0rd`

---

## 🧪 Create Tables

Use pgAdmin, Adminer, or Mongo Express to browse, query, and modify data easily.

---

## 🧼 Stopping & Cleaning

To stop the environment:

```bash
npm run db:down          # Stop & delete volumes
docker-compose down -v   # CLI alternative
```

To remove all volumes (i.e., wipe databases):

```bash
docker-compose down -v
```

---

## 📌 Notes

- Do **not** use `localhost` as a hostname inside pgAdmin or Adminer — use the service name defined in `docker-compose.yml` (`postgres`, `mssql`).
- All services are on a shared Docker network and can resolve each other by container name.
- Port conflicts? Modify the exposed ports in `docker-compose.yml`.

---

## 📂 Project Structure

```
local-db-setup/
├── docker-compose.yml
├── .env                 # your credentials
├── init/                # Postgres seed
│   └── seed.sql
├── init-mysql/          # MySQL seed
│   └── seed.sql
├── init-mongo/          # Mongo seed
│   └── init.js
├── pgadmin/
│   └── servers.json
├── package.json
├── Makefile
└── README.md
```

---

📘 Tips
- Need Redis, ElasticSearch, or RabbitMQ? Just plug them in.
- Want pre-built datasets? Add data.sql, dump.json, etc.
- This is production-style architecture made dev-friendly.

---

## 🔮 Coming Soon

- SQL seed files for both databases
- Optional volume-based initialization
- pgAdmin server pre-config export

---

## 👨‍💻 Author

Built by [Christopher Tønnesland](link) — Feel free to use and adapt this for your projects.
