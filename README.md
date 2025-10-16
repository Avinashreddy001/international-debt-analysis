# International Debt Analysis

Analyzing real World Bank international debt data using SQLite3 and SQL queries.

## Project Overview

This project explores global external debt statistics from the World Bank, analyzing trends across 140+ countries from 2015-2023.

**Key Findings (2023 Data):**
- China leads with $2.42 trillion in external debt
- India has $646 billion in external debt
- 5 types of debt series tracked
- 411 data records across multiple indicators

## Database Setup

### Quick Start

1. Clone the repository
2. Ensure you have Python 3 and pandas installed
3. Run the setup script:
   ```bash
   python setup.py
   ```
   This automatically:
   - Reads the World Bank CSV
   - Creates SQLite database
   - Imports 411 rows of data
   - Verifies the import

4. Database file `database.db` is created locally (not in Git)

### Manual Query Testing

Test a query directly:
```bash
sqlite3 database.db "SELECT country_name, year_2023 FROM international_debt WHERE year_2023 IS NOT NULL ORDER BY year_2023 DESC LIMIT 5;"
```

## SQL Queries

The `sql/queries.sql` file contains 8 analysis queries:

1. **Top 15 Countries by Total Debt (2023)** - Countries with highest external debt
2. **Debt Growth Analysis (2015-2023)** - Countries with largest debt increase
3. **Debt by Series Type** - Breakdown of debt categories
4. **Average Debt per Country** - Average across all debt types
5. **Global Debt Trend** - Total global debt over time
6. **Fastest Growing Debts** - Countries with highest percent growth
7. **Countries with Decreasing Debt** - Countries reducing their debt
8. **Statistics Summary** - Overall debt statistics

## Project Structure

```
international-debt-analysis/
├── data/
│   └── international_debt.csv          # World Bank debt data (411 rows)
├── sql/
│   └── queries.sql                     # 8 SQL analysis queries
├── setup.py                            # Automated database setup
├── database.db                         # SQLite database (local only)
├── .gitignore
└── README.md
```

## Data Source

World Bank International Debt Statistics
- **Source:** https://databank.worldbank.org/
- **Time Period:** 2015-2023
- **Countries:** 140+
- **Indicators:** 5 debt series types

## Tools & Technologies

- SQLite3 - Database
- Python 3 - Data processing
- Pandas - CSV handling
- Git/GitHub - Version control
- VSCode - Development environment

## Key SQL Concepts Used

- SELECT with WHERE filtering
- GROUP BY and aggregation (SUM, AVG, COUNT)
- ORDER BY sorting
- CASE statements for calculations
- Joins (implicit)
- NULL handling

## Running Queries

To run a specific query from `sql/queries.sql`, copy it and run:

```bash
sqlite3 database.db "YOUR_QUERY_HERE"
```

Or for larger queries, save to a file and run:

```bash
sqlite3 database.db < sql/queries.sql
```

## Learning Outcomes

Through this project you'll learn:
- ✅ Database design and schema creation
- ✅ Data cleaning and transformation
- ✅ SQL SELECT queries with filtering
- ✅ Aggregation and grouping
- ✅ Real-world data analysis
- ✅ Git workflow and version control