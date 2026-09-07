# Frontend Starter

React.js + Vite starter setup for the Financial Journal Entry System assessment.

## Base Stack

- React 19
- Vite
- React Router
- Axios — API communication
- React Hook Form — form management
- Zod — validation schema
- `@hookform/resolvers` — React Hook Form/Zod integration
- ESLint — code quality

## Setup

```bash
cd frontend
npm install
```

Start development server:

```bash
npm run dev
```

Build for production:

```bash
npm run build
```

The Vite development server proxies `/api` requests to `http://localhost:5000`.

## Suggested Structure

```text
frontend/
├── src/
│   ├── components/
│   ├── pages/
│   ├── services/
│   ├── hooks/
│   ├── schemas/
│   ├── utils/
│   ├── App.jsx
│   ├── main.jsx
│   └── styles.css
├── index.html
├── vite.config.js
├── package.json
└── README.md
```

The candidate may modify the structure and choose an appropriate state-management approach.

## Required Screens

1. Journal Entry List
2. Create Journal Entry
3. Journal Entry Details

## Required Capabilities

- Dynamic journal line rows
- Account selection
- Debit/Credit selection
- Amount validation
- Real-time debit and credit totals
- Search
- Date filtering
- Pagination
- API error handling
- Responsive layout
