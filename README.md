
## Netflix Dataset Analysis with MySQL
This project focuses on analyzing the Netflix Titles dataset using MySQL. It showcases the ability to perform data cleaning, transformation, aggregation, and querying to derive meaningful insights from a structured dataset. The project is designed to help build strong SQL skills.

## Project Objectives
- Practice data cleaning techniques using SQL.
- Use aggregate functions, filtering, sorting, and grouping.
- Gain insights into Netflix's content distribution across years, genres, countries, and formats (TV Shows/Movies).

## Dataset Description
The dataset is a modified version of the Netflix Titles dataset commonly found on platforms like Kaggle. It contains details about TV shows and movies available on Netflix, including:

Columns: 
- show_id – Unique ID (Primary key)
- category – Type of content (Movie or TV Show)
- title – Name of the title
- director, cast, country – Metadata
- date_added – Date when content was added to Netflix
- release_year – Year of original release
- rating – Maturity rating (TV-MA, PG, etc.)
- duration – Duration (e.g., 90 min or 2 Seasons)
- listed_in – Genre(s)
- summary – Description of the content

## Project workflow

## Data Cleaning Steps
- Converted NULL values in director, cast, and country columns to 'None' for consistency.
- Disabled SQL_SAFE_UPDATES temporarily to allow table-wide updates.

## Key SQL queries and insights

 ## Database and table creation 
 
 CREATE DATABASE netflix_db;
 CREATE TABLE netflix_title (show_id VARCHAR(10) PRIMARY KEY, category VARCHAR(200), title VARCHAR(200), director TEXT, cast   TEXT, country VARCHAR(200), date_added VARCHAR(100), release_year int, rating VARCHAR(50), duration VARCHAR(50), listed_in    VARCHAR(200), summary TEXT);

## Data import 
You can load the CSV file into MySQL using either of the following methods:

### Method 1: MySQL Workbench
Use the **"Table Data Import Wizard"** feature available in MySQL Workbench:
- Go to your database.
- Right-click on the schema > **Table Data Import Wizard**.
- Select your CSV file and follow the prompts to map columns and import data.

### Method 2: Python Script (Alternative)
If the import wizard is slow or fails to load the file, you can import the data using a Python script with **Pandas** and **SQLAlchemy** or **mysql-connector-python**.

import pandas as pd
from sqlalchemy import create_engine
df = pd.read_csv("netflix_titles.csv") NOTE: Make sure your file is in the same directory or give a relative path
engine = create_engine("mysql+mysqlconnector://<username>:<password>@<host>/<database_name>")
df.to_sql('netflix_title', con=engine, if_exists='replace', index=False)
print("Data imported successfully.")

## Data exploration
- Identified and replaced NULL values in columns with 'None'. 
- Analyzed how many titles were released each year.
- Explored how many titles are categorized as Movies vs. TV Shows.
- Analyzed how many titles were released each year.

## How to Use
- Import the dataset and run the provided SQL schema.
- Execute the queries from netflix_analysis.sql.
- Explore and customize the queries for your own insights.





