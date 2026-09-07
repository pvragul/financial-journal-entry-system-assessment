CREATE TABLE dbo.Accounts (
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    AccountCode VARCHAR(20) NOT NULL UNIQUE,
    AccountName VARCHAR(200) NOT NULL,
    AccountType VARCHAR(50) NOT NULL,
    IsActive BIT NOT NULL CONSTRAINT DF_Accounts_IsActive DEFAULT (1),
    CreatedAt DATETIME2 NOT NULL CONSTRAINT DF_Accounts_CreatedAt DEFAULT (SYSDATETIME())
);

CREATE TABLE dbo.JournalEntries (
    Id BIGINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ReferenceNo VARCHAR(50) NOT NULL UNIQUE,
    TransactionDate DATE NOT NULL,
    Description VARCHAR(500) NULL,
    CreatedAt DATETIME2 NOT NULL CONSTRAINT DF_JournalEntries_CreatedAt DEFAULT (SYSDATETIME())
);

CREATE TABLE dbo.JournalEntryLines (
    Id BIGINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    JournalEntryId BIGINT NOT NULL,
    AccountId INT NOT NULL,
    TransactionType VARCHAR(10) NOT NULL,
    Amount DECIMAL(18,2) NOT NULL,

    CONSTRAINT FK_JournalEntryLines_JournalEntries
        FOREIGN KEY (JournalEntryId)
        REFERENCES dbo.JournalEntries(Id),

    CONSTRAINT FK_JournalEntryLines_Accounts
        FOREIGN KEY (AccountId)
        REFERENCES dbo.Accounts(Id),

    CONSTRAINT CK_JournalEntryLines_TransactionType
        CHECK (TransactionType IN ('DEBIT', 'CREDIT')),

    CONSTRAINT CK_JournalEntryLines_Amount
        CHECK (Amount > 0)
);

CREATE TABLE dbo.AuditLogs (
    Id BIGINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    EntityName VARCHAR(100) NOT NULL,
    EntityId BIGINT NOT NULL,
    Action VARCHAR(50) NOT NULL,
    PerformedBy VARCHAR(100) NULL,
    Details VARCHAR(MAX) NULL,
    PerformedAt DATETIME2 NOT NULL CONSTRAINT DF_AuditLogs_PerformedAt DEFAULT (SYSDATETIME())
);

CREATE INDEX IX_Accounts_AccountCode
    ON dbo.Accounts(AccountCode);

CREATE INDEX IX_JournalEntries_TransactionDate
    ON dbo.JournalEntries(TransactionDate);

CREATE INDEX IX_JournalEntryLines_JournalEntryId
    ON dbo.JournalEntryLines(JournalEntryId);

CREATE INDEX IX_JournalEntryLines_AccountId
    ON dbo.JournalEntryLines(AccountId);
