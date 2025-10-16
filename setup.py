import pandas as pd
import sqlite3

print("=" * 60)
print("INTERNATIONAL DEBT ANALYSIS - DATABASE SETUP")
print("=" * 60)

# STEP 1: Read World Bank CSV
print("\n[1] Reading World Bank data...")
df = pd.read_csv('data/international_debt.csv')
print(f"    Loaded {len(df)} rows")

# STEP 2: Rename columns to match our schema
print("\n[2] Renaming columns...")
df.columns = ['country_name', 'country_code', 'counterpart_area_name', 'counterpart_area_code', 
              'series_name', 'series_code', 'year_2015', 'year_2016', 'year_2017', 'year_2018', 
              'year_2019', 'year_2020', 'year_2021', 'year_2022', 'year_2023']

# STEP 3: Convert year columns to numeric (missing values become NaN)
print("\n[3] Converting year columns to numbers...")
year_columns = ['year_2015', 'year_2016', 'year_2017', 'year_2018', 'year_2019', 
                'year_2020', 'year_2021', 'year_2022', 'year_2023']
for col in year_columns:
    df[col] = pd.to_numeric(df[col], errors='coerce')

# STEP 4: Create SQLite database
print("\n[4] Creating SQLite database...")
conn = sqlite3.connect('database.db')
cursor = conn.cursor()

# Drop table if exists
cursor.execute('DROP TABLE IF EXISTS international_debt')

# Create table
cursor.execute('''
    CREATE TABLE international_debt (
        country_name TEXT,
        country_code TEXT,
        counterpart_area_name TEXT,
        counterpart_area_code TEXT,
        series_name TEXT,
        series_code TEXT,
        year_2015 REAL,
        year_2016 REAL,
        year_2017 REAL,
        year_2018 REAL,
        year_2019 REAL,
        year_2020 REAL,
        year_2021 REAL,
        year_2022 REAL,
        year_2023 REAL
    )
''')

# STEP 5: Insert data into database
print("\n[5] Inserting data into database...")
df.to_sql('international_debt', conn, if_exists='append', index=False)

# STEP 6: Verify
print("\n[6] Verifying import...")
cursor.execute('SELECT COUNT(*) FROM international_debt')
row_count = cursor.fetchone()[0]
print(f"    Total rows in database: {row_count}")

cursor.execute('SELECT COUNT(DISTINCT country_name) FROM international_debt')
country_count = cursor.fetchone()[0]
print(f"    Unique countries: {country_count}")

cursor.execute('SELECT COUNT(DISTINCT series_name) FROM international_debt')
series_count = cursor.fetchone()[0]
print(f"    Unique debt series: {series_count}")

# Show sample data
print("\n[7] Sample data (first 3 rows):")
cursor.execute('SELECT * FROM international_debt LIMIT 3')
for row in cursor.fetchall():
    print(f"    {row[0]} | {row[5]} | {row[6]}")

conn.commit()
conn.close()

print("\n" + "=" * 60)
print("✅ SETUP COMPLETE! Database ready to use.")
print("=" * 60)