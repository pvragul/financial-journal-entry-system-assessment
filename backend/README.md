# Backend Starter

Node.js + Express.js + Microsoft SQL Server starter setup for the assessment.

## Base Stack

- Node.js
- Express.js
- Microsoft SQL Server
- `mssql` — SQL Server driver
- `dotenv` — environment configuration
- `cors` — CORS handling
- `helmet` — HTTP security headers
- `zod` — request validation
- `jest` + `supertest` — testing
- `nodemon` — development server

## Setup

```bash
cd backend
npm install
```

Copy `.env.example` to `.env` and configure the SQL Server connection.

Start development server:

```bash
npm run dev
```

Start production-style server:

```bash
npm start
```

Health check:

```http
GET /api/health
```

## Suggested Structure

```text
backend/
├── src/
│   ├── config/
│   │   └── database.js
│   ├── controllers/
│   ├── middleware/
│   ├── repositories/
│   ├── routes/
│   ├── services/
│   ├── validators/
│   ├── app.js
│   └── server.js
├── .env.example
├── package.json
└── README.md
```

The candidate may modify the structure as long as the implementation remains maintainable and responsibilities are reasonably separated.

## Required APIs

- `GET /api/accounts`
- `POST /api/journal-entries`
- `GET /api/journal-entries`
- `GET /api/journal-entries/:id`

## Key Requirements

- Request validation
- Parameterized SQL queries
- Centralized error handling
- Pagination
- Financial validation
- Atomic database transactions
- Audit logging

The implementation must ensure that journal entries cannot be partially persisted.
