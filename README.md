# Credit Card Default Risk Analysis

## Project Overview

This project analyses 30,000 credit-card customer records to identify the demographic, financial, and repayment patterns associated with next-month payment default.

The complete workflow includes exploratory data analysis, data cleaning, preprocessing, feature engineering, visualization, risk segmentation, and SQL-based business analysis.

## Tools Used

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- SQL
- SQLite
- Microsoft Excel
- Google Colab

## Dataset

- Total customers: 30,000
- Default customers: 6,636
- Non-default customers: 23,364
- Overall default rate: 22.12%
- Missing values: 0
- Exact duplicate rows: 0

## Project Workflow

1. Exploratory Data Analysis
2. Data Quality Assessment
3. Data Cleaning
4. Data Preprocessing
5. Feature Engineering
6. Outlier Detection
7. Data Visualization
8. SQL Business Analysis
9. Risk Segmentation
10. Business Insight Generation

## Key Findings

- The overall customer default rate was 22.12%.
- Customers with no delayed months had an 11.71% default rate.
- Customers delayed in all six observed months had a 70.32% default rate.
- The High Risk segment recorded a 46.94% default rate.
- The Medium Risk segment recorded a 24.38% default rate.
- The Low Risk segment recorded a 10.89% default rate.
- Male customers had a 24.17% default rate, compared with 20.78% for female customers.
- Customers in the Very Low credit-limit group had the highest observed default rate at 31.79%.
- Repayment-delay variables showed the strongest positive relationship with default.

## Feature Engineering

The project created the following analytical features:

- Average and total bill amount
- Average and total payment amount
- Bill-to-limit ratio
- Payment-to-bill ratio
- Number of delayed months
- Maximum payment delay
- Age groups
- Credit-limit groups
- Customer risk segments
- Outlier indicator columns

## SQL Analysis

Eleven SQL queries were created to analyse:

- Overall default KPIs
- Gender and education performance
- Marital-status patterns
- Age-group default rates
- Credit-limit groups
- Customer risk segments
- Delayed-month behaviour
- Payment behaviour
- High-risk customers
- Risk-segment ranking

## Repository Structure

```text
credit-card-default-risk-analysis/
│
├── data/
│   ├── credit_card_default_analysis_ready.csv
│   ├── credit_card_default_analysis_ready.xlsx
│   └── credit_card_default_analysis.db
│
├── notebooks/
│   └── Credit_Card_Default_Risk_Analysis.ipynb
│
├── sql/
│   ├── credit_card_sql_queries.sql
│   └── credit_card_sql_analysis.xlsx
│
├── visualizations/
│   └── Generated EDA charts
│
├── reports/
│   ├── Week 3 final report
│   └── Supporting analytical reports
│
├── .gitignore
└── README.md