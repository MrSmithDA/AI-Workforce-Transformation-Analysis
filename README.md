# AI Workforce Transformation Analysis

This project explores the relationship between AI adoption, automation, layoffs, employee satisfaction, productivity, and revenue growth using a large simulated workforce dataset.

I started this project for two reasons:

1. To build a more realistic end-to-end analytics project than the typical dashboard tutorials.
2. To learn PostgreSQL and strengthen my SQL, Python, and data analysis skills while transitioning from IT leadership into data analytics.

Rather than focusing only on visualization, I wanted to work through the full analytics workflow: data inspection, cleaning, feature engineering, database loading, SQL analysis, and reporting.

## Business Question

Many organizations are investing heavily in AI and automation, but it is still unclear whether those investments actually improve business outcomes.

This project explores questions such as:

* Do companies with higher AI adoption experience stronger revenue growth?
* Does automation improve productivity?
* How does automation affect employee satisfaction?
* Which industries appear to benefit most from AI adoption?
* Is higher automation associated with increased or decreased layoffs?

## Dataset

Source:
https://www.kaggle.com/datasets/aiexplorer77/ai-hiring-layoffs-and-workforce-analytics

The dataset contains 1,000,000 simulated company records across multiple industries, departments, and regions.

## Tools Used

* Python
* Pandas
* PostgreSQL
* SQLAlchemy
* DBeaver
* Git / GitHub
* Power BI (in progress)

## Project Workflow

### 1. Data Inspection

Performed initial data quality assessment, reviewed distributions, validated data types, and identified missing values.

### 2. Data Cleaning

* Removed data quality issues
* Filled missing values using industry-level median imputation
* Validated results after cleaning

### 3. Feature Engineering

Created additional business-focused fields:

* AI Adoption Tier
* Automation Tier

These categories allow comparisons between organizations with different levels of AI maturity.

### 4. Database Loading

Loaded the cleaned dataset into PostgreSQL using SQLAlchemy and verified successful ingestion of all 1,000,000 records.

### 5. SQL Analysis

Used PostgreSQL to investigate relationships between AI adoption, automation, and business performance.

Current findings include:

* Companies with higher AI adoption demonstrate substantially higher average revenue growth.
* Higher AI adoption is associated with increased productivity.
* Automation appears positively correlated with employee satisfaction.
* Additional analysis is ongoing.

## Repository Structure

notebooks/

* Data inspection, cleaning, and ETL notebooks

sql/

* Business questions and analysis queries

dashboard/

* Power BI files and screenshots

reports/

* Final report and project documentation

## Current Status

Completed:

* Data inspection
* Data cleaning
* Feature engineering
* PostgreSQL integration
* Initial business analysis

In Progress:

* Advanced SQL analysis
* Dashboard development
* Final case study

## About Me

I'm transitioning from IT leadership and business systems work into data analytics. My background includes IT operations, reporting automation, business systems development, stakeholder support, and process improvement.

This repository documents that transition while showcasing the technical and analytical skills I'm actively building.
