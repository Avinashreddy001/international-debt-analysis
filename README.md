# international-debt-analysis
Analyzing global financial data using SQLite3 and SQL

International Debt Analysis
Analyzing global financial data using SQLite3 and SQL queries.
Project Goal
Explore World Bank international debt data to discover:

Which countries owe the most debt
Average debt across countries
Common debt indicators
Practice SQL grouping, totals, and comparisons

Project Structure
international-debt-analysis/
├── data/
│   └── international_debt.csv    # World Bank debt data
├── sql/
│   └── queries.sql               # SQL analysis queries
├── database.db                   # SQLite database (local only)
└── README.md
Setup Instructions
1. Create the Database
Open terminal in project root and run:
bashsqlite3 database.db
2. Create the Schema
Run these SQL commands in sqlite3:
sqlCREATE TABLE IF NOT EXISTS international_debt (
    id INTEGER PRIMARY KEY,
    country_name TEXT NOT NULL,
    country_code TEXT NOT NULL,
    indicator_name TEXT NOT NULL,
    indicator_code TEXT NOT NULL,
    debt_value INTEGER NOT NULL,
    year INTEGER NOT NULL
);
3. Import Data
bash.mode csv
.import data/international_debt.csv international_debt
4. Run Queries
Open sql/queries.sql and execute queries in sqlite3
Key Queries

Top 10 countries by total debt
Average debt per country
Debt by indicator type
Year-over-year comparisons

Tools Used

SQLite3
VSCode
Git/GitHub
