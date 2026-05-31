# Data Engineering Challenge

## Overview

This project implements a Medallion Architecture (Bronze, Silver, and Gold) data pipeline in BigQuery using SQL and BigQuery ML (BQML).

The solution ingests raw transaction data, applies data quality and transformation rules, and generates customer segmentation insights using a K-Means clustering model.

## Architecture

```text
retail_bronze.raw_transactions
            ↓
retail_silver.cleaned_transactions
            ↓
retail_gold.customer_segment_model
            ↓
retail_gold.analytics_customer_segments
```

## Bronze Layer

The Bronze layer stores the raw transaction data loaded into BigQuery without modification.

Dataset:

* retail_bronze

Table:

* raw_transactions

## Silver Layer

The Silver layer applies data cleansing, standardisation, and feature engineering.

Transformations performed:

* Converted date fields to DATE data types.
* Defaulted missing signup_date values to purchase_date.
* Defaulted missing is_returned values to FALSE.
* Removed records where amount <= 0.
* Created the days_to_first_purchase feature.

Table:

* retail_silver.cleaned_transactions

SQL:

* sql/silver_transform.sql

## Gold Layer

The Gold layer uses BigQuery ML to train a K-Means clustering model and generate customer segments.

Model:

* retail_gold.customer_segment_model

Output Table:

* retail_gold.analytics_customer_segments

SQL:

* sql/gold_model_training.sql
* sql/gold_prediction.sql

## Repository Structure

```text
sql/
├── silver_transform.sql
├── gold_model_training.sql
└── gold_prediction.sql

docs/
├── orchestration.md
└── ai_usage.md

proof/
├── final_table_screenshot.png
└── model_evaluation.png
```

## Assumptions

* The source data contained the string value 'NULL' for certain fields and these were handled during transformation.
* Purchase dates were treated as valid fallback values for missing signup dates.
* Customer segmentation was performed using BigQuery ML K-Means clustering based on amount and item_category.

## Supporting Documentation

* docs/orchestration.md
* docs/ai_usage.md

## Proof of Execution

* proof/model_evaluation.png
* proof/final_table_screenshot.png
