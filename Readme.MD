# 🛠️ local-db-setup

Local development environment with **PostgreSQL**, **Microsoft SQL Server**, **MySQL**, **MongoDB**, and browser-based UI tools using Docker Compose.

---

## 📦 Services

| Service         | Description                        | Port       |
|----------------|------------------------------------|------------|
| PostgreSQL     | Relational database                | `5432`     |
| SQL Server     | Microsoft SQL Server 2022          | `1433`     |
| MySQL          | Relational database                | `3306`     |
| MongoDB        | NoSQL document database            | `27017`    |
| pgAdmin        | Web UI for PostgreSQL              | `8082`     |
| Adminer        | Web UI for SQL Server (light)      | `8081`     |
| Mongo Express  | Web UI for MongoDB                 | `8083`     |

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

Using Docker directly:

```bash
docker-compose --env-file .env up -d
```

Using npm scripts:

```bash
npm run db:postgres     # Start PostgreSQL + pgAdmin
npm run db:mssql        # Start SQL Server + Adminer
npm run db:mysql        # Start MySQL only
npm run db:mongo        # Start MongoDB + Mongo Express
npm run db:up           # Start everything
npm run db:down         # Stop all and remove volumes
```

Using Makefile (if installed):

```bash
make db-postgres
make db-mongo
make db-down
```

---

### 4. Access Tools

#### 🐘 pgAdmin (PostgreSQL)

- URL: [http://localhost:8082](http://localhost:8082)
- Email: `admin@local.dev`
- Password: `admin123`
- Hostname (when adding a server): `postgres`

#### 🧰 Adminer (SQL Server)

- URL: [http://localhost:8081](http://localhost:8081)
- System: `Microsoft SQL Server`
- Server: `mssql`
- Username: `sa`
- Password: `YourStrong!Passw0rd`

#### 🍃 Mongo Express

- URL: [http://localhost:8083](http://localhost:8083)
- Server: `mongo`

---

## 🧪 Create Tables & Seed Data

- Use pgAdmin, Adminer, or Mongo Express to browse, query, and modify data.
- Default seed files:
  - PostgreSQL: `init/seed.sql`
  - MySQL: `init-mysql/seed.sql`
  - MongoDB: `init-mongo/init.js`

> Seeds run only on first container startup or after volume reset.

---

## 🧼 Stopping & Cleaning

To stop and remove everything:

```bash
npm run db:down          # Or
docker-compose down -v
```

To cleanly reset all data, re-run with:

```bash
docker-compose down -v && docker-compose --env-file .env up -d
```

---

## 📌 Notes

- Do **not** use `localhost` as hostname inside pgAdmin or Adminer — use container names (`postgres`, `mssql`, `mongo`, etc.).
- Services share a Docker network and can resolve each other by container name.
- If ports are taken, change the `host:container` mapping in `docker-compose.yml`.

---

## 📂 Project Structure

```
local-db-setup/
├── docker-compose.yml
├── .env                 # Your credentials
├── init/                # PostgreSQL seed
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

## 🔮 Coming Soon

- SQL seed files for each DB
- Volume-based data initialization
- Optional CI integration
- DBeaver in Docker

---

## 👨‍💻 Author

Built by [Christopher Tønnesland](#) — use, fork, contribute. Make local dev fast, clean, and production-style.

---

V7diB62n-X2iwAv
