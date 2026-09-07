INSERT INTO dbo.Accounts (AccountCode, AccountName, AccountType, IsActive)
VALUES
    ('1001', 'Cash', 'ASSET', 1),
    ('1002', 'Bank Account', 'ASSET', 1),
    ('2001', 'Accounts Payable', 'LIABILITY', 1),
    ('3001', 'Capital', 'EQUITY', 1),
    ('4001', 'Sales Revenue', 'INCOME', 1),
    ('5001', 'Office Expense', 'EXPENSE', 1),
    ('6001', 'Office Equipment', 'ASSET', 1),
    ('9999', 'Inactive Test Account', 'EXPENSE', 0);
