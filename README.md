# Financial Journal Entry System Assessment

## Full Stack Developer Technical Assessment

Build a small full-stack financial journal entry management system using **React.js, Node.js, Express.js, and Microsoft SQL Server**.

> **Important: Fork-Only Assessment**
>
> Candidates must **fork this repository** and complete the assessment in their own fork. Do **not** request collaborator/write access to the original repository.
>
> The original repository is the assessment template. Candidates must not commit implementation code directly to the original `main` branch.

## Candidate Workflow

1. Fork this repository to your own GitHub account.
2. Clone **your fork** locally.
3. Create a working branch in your fork, for example:

```bash
git checkout -b feature/journal-entry-system
```

4. Complete the assessment in your fork.
5. Commit and push your changes to your fork.
6. Share the URL of your completed fork with the evaluator.

Example:

```bash
git clone https://github.com/<your-github-username>/financial-journal-entry-system-assessment.git
cd financial-journal-entry-system-assessment
git checkout -b feature/journal-entry-system
```

### Repository Rules

- ❌ Do not ask for collaborator access to the original repository.
- ❌ Do not commit directly to the original repository.
- ❌ Do not modify the original assessment repository's `main` branch.
- ✅ Work only in your own fork.
- ✅ Create your implementation branch inside your fork.
- ✅ Push your completed solution to your fork.
- ✅ Submit your fork/repository URL for evaluation.

---

## Objective

Demonstrate practical engineering skills in:

- React component and state architecture
- REST API development
- MSSQL schema design
- Validation and error handling
- Database transactions
- Financial data integrity
- Code organization and documentation

## Core Business Rule

This system follows **double-entry accounting**:

```text
Total Debit = Total Credit
```

A journal entry must never be persisted when this rule is violated.

## Mandatory Features

### 1. Account Master

Each account should contain:

- Id
- AccountCode
- AccountName
- AccountType
- IsActive

Suggested account types:

- ASSET
- LIABILITY
- EQUITY
- INCOME
- EXPENSE

Required API:

```http
GET /api/accounts
GET /api/accounts?search=cash
```

Only active accounts should be available when creating journal entries.

### 2. Create Journal Entry

Required API:

```http
POST /api/journal-entries
```

Example request:

```json
{
  "referenceNo": "JV-2026-0001",
  "transactionDate": "2026-09-07",
  "description": "Purchase of office equipment",
  "entries": [
    {
      "accountId": 1,
      "type": "DEBIT",
      "amount": 50000
    },
    {
      "accountId": 2,
      "type": "CREDIT",
      "amount": 50000
    }
  ]
}
```

### Mandatory Validation Rules

1. A journal entry must contain at least two lines.
2. Total Debit must equal Total Credit.
3. Amount must be greater than zero.
4. Every account must exist.
5. Every account must be active.
6. Reference number must be unique.
7. Backend validation is mandatory; frontend validation alone is insufficient.

### Transaction Integrity

The following operations must execute atomically:

1. Create journal entry header.
2. Create journal entry lines.
3. Create audit log.

If any operation fails, the entire database transaction must be rolled back. Partial financial records must never remain in the database.

### 3. Journal Entry Listing

Required API:

```http
GET /api/journal-entries?page=1&limit=10
GET /api/journal-entries?search=office
GET /api/journal-entries?fromDate=2026-09-01&toDate=2026-09-30
```

Support:

- Pagination
- Search
- Date filtering

### 4. Journal Entry Details

Required API:

```http
GET /api/journal-entries/:id
```

Return header information and all journal lines with account details.

## Frontend Requirements

Create the following screens.

### Journal Entry List

Display:

- Reference Number
- Transaction Date
- Description
- Total Debit
- Total Credit

Include pagination, search, date filtering, create action, and details view.

### Create Journal Entry

Include:

- Reference Number
- Transaction Date
- Description
- Dynamic journal line rows

Each line should support:

| Account | Type | Amount | Action |
|---|---|---:|---|
| Account Dropdown | Debit/Credit | Numeric Input | Remove |

Users must be able to add and remove rows.

Display real-time:

- Total Debit
- Total Credit
- Difference

Clearly indicate when totals do not match.

### Journal Entry Details

Display journal header and lines in an accounting-friendly format.

## Backend Expectations

The implementation should maintain reasonable separation of concerns. A suggested flow is:

```text
Route
  ↓
Controller
  ↓
Service
  ↓
Repository / Data Access
  ↓
MSSQL
```

The exact folder structure is flexible.

## Error Handling

Implement centralized error handling.

Avoid:

- Unhandled promise rejections
- Empty catch blocks
- Exposing SQL errors to API consumers
- Inconsistent API response formats

Example:

```json
{
  "success": false,
  "message": "Validation failed",
  "errors": [
    {
      "field": "entries",
      "message": "Total debit must equal total credit"
    }
  ]
}
```

## Security Requirements

- Validate all incoming API data.
- Use parameterized SQL queries.
- Do not build SQL using direct user-input interpolation.
- Authentication is optional for the core assessment.

For audit logging, a mocked user header is acceptable:

```http
X-User-Id: 101
```

JWT authentication is considered a bonus.

## Performance Expectations

Consider:

- Server-side pagination
- Efficient SQL queries
- Appropriate indexes
- Avoiding unnecessary database calls
- Avoiding loading all records into application memory

## Required Deliverables

- Frontend source code
- Backend source code
- `database/schema.sql`
- `database/seed-data.sql`
- `.env.example`
- README with setup instructions
- Repository URL

## Suggested Repository Structure

```text
financial-journal-entry-system-assessment/
├── frontend/
├── backend/
├── database/
│   ├── schema.sql
│   └── seed-data.sql
├── README.md
└── .gitignore
```

## Bonus Features

Optional enhancements:

- JWT authentication
- Role-based authorization
- Approval workflow: DRAFT, SUBMITTED, APPROVED, REJECTED
- Unit/integration tests
- Asset management module
- Improved API documentation

## Evaluation Criteria

| Area | Weight |
|---|---:|
| React.js implementation | 20% |
| Node.js / Express.js | 20% |
| MSSQL design and queries | 15% |
| Transaction and data integrity | 15% |
| Validation and error handling | 10% |
| Architecture and code quality | 10% |
| Performance considerations | 5% |
| Documentation | 5% |

## Assessment Focus

This assessment prioritizes practical engineering capability over basic CRUD implementation. Particular emphasis is placed on financial data integrity, atomic database operations, validation strategy, maintainable architecture, and problem-solving quality.

## Submission Checklist

Before submitting, confirm that:

- [ ] The solution is implemented in your own fork.
- [ ] The original repository has not been modified.
- [ ] The implementation is committed to a branch in your fork.
- [ ] Frontend can be started successfully.
- [ ] Backend can be started successfully.
- [ ] Database schema and seed scripts are included.
- [ ] Required APIs are implemented.
- [ ] Debit and credit validation works correctly.
- [ ] Database transaction rollback is implemented.
- [ ] README contains setup and run instructions.
- [ ] No secrets or `.env` files have been committed.

## Expected Submission

Submit the URL of your **completed fork** to the evaluator.

Do not request write/collaborator access to this assessment repository.
