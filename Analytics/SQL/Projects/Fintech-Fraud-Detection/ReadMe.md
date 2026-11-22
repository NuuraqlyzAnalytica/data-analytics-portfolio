# Machine Learning for Financial Fraud Detection

## Project Overview

This project was completed as part of the **Fintech course at Berkeley College during the Fall semester**. The course introduced the application of Artificial Intelligence (AI) and Machine Learning (ML) in the financial industry.

For this project, I independently selected a topic, identified a dataset, explored the data, applied analytical and machine learning techniques, and presented the findings.

The project focuses on using machine learning to identify potentially fraudulent financial transactions and examining the business implications of incorrectly classifying legitimate transactions as fraudulent.

## Project Question

**How effectively can machine learning techniques distinguish fraudulent from legitimate transactions, and what are the implications of false-positive classifications for merchants and financial institutions?**

## Dataset and Source

The project uses the **Synthetic Financial Datasets for Fraud Detection (PaySim)** dataset, obtained from Kaggle.

The dataset contains simulated mobile-money transactions and includes:

- **6,362,620** total transactions
- **11** columns
- **8,213** transactions labeled as fraudulent
- **6,354,407** transactions labeled as legitimate

The original dataset was not uploaded to this repository because of its size. It can be accessed through its original source:

[PaySim – Synthetic Financial Datasets for Fraud Detection (Kaggle)](https://www.kaggle.com/datasets/ealaxi/paysim1)

## Platform and Technologies

The project was developed and executed in **Databricks**.

| Technology | Application |
|---|---|
| Databricks | Development and execution environment |
| SQL | Data exploration and initial analysis |
| Python | Data preparation, feature engineering, model training, and evaluation |
| Apache Spark | Working with the dataset and sampling |
| Pandas and NumPy | Data manipulation and numerical operations |
| Scikit-learn | Logistic Regression and model evaluation |

## Project Methodology

The project followed a sequence of analytical and modeling steps:

### 1. Data Exploration – SQL

SQL was used to examine the dataset, understand transaction distributions, investigate fraudulent and legitimate transactions, compare transaction categories, and explore transaction amounts.

This initial analysis helped identify patterns and determine which transaction characteristics could be used in the modeling stage.

### 2. Data Preparation – Python

Python was used to prepare the data for machine learning. This included creating a 10% sample, selecting relevant features, encoding categorical transaction types, and preparing the training and testing datasets.

### 3. Machine Learning – Logistic Regression

A Logistic Regression model was developed using transaction step, transaction type, and transaction amount as input features. Class weighting was applied to give the relatively rare fraudulent transactions greater influence during model training.

### 4. Model Evaluation

The model was evaluated using a confusion matrix and classification report. The evaluation focused on its ability to identify fraudulent transactions while also considering how many legitimate transactions were incorrectly flagged.

### 5. False-Positive Investigation

Legitimate transactions incorrectly classified as fraudulent were examined to identify patterns in transaction categories and amounts.

### 6. Business Implications

The findings were considered from the perspective of merchants, financial institutions, and customers, with attention to the potential consequences of false alerts and missed fraudulent transactions.

## Key Findings

The analysis highlighted several important findings:

- Fraudulent transactions represented approximately **0.13%** of the original dataset.
- Fraud was present in the TRANSFER and CASH_OUT transaction categories.
- The Logistic Regression model identified **153 of 171 fraudulent transactions** in the test dataset, achieving approximately **89% fraud recall**.
- Only approximately **0.53% of the transactions flagged by the model were actually fraudulent**.
- The model incorrectly flagged **28,706 legitimate transactions**, demonstrating the potential operational impact of false-positive classifications.

These results illustrate the challenge of detecting rare fraudulent transactions while minimizing disruption to legitimate financial activity.

## Project Limitations

This project represents a baseline machine learning experiment using simulated financial transaction data.

Some important limitations include:

- The dataset contains simulated transactions rather than live financial transactions.
- The model used only three original input features: transaction step, transaction type, and transaction amount.
- Evaluation was performed using a held-out test sample from the same dataset, rather than an independent dataset.
- The model is not intended to represent a production-ready fraud detection system.

## Repository Contents

The project folder contains the following supporting materials:

| Resource | Description |
|---|---|
| Databricks notebooks | SQL and Python code used for data exploration, preparation, modeling, and evaluation |
| PowerPoint presentation | Visual summary of the project, methodology, findings, and business implications |
| Word document report | Detailed written report documenting the project and its results |
| Dataset source | Link to the original PaySim dataset on Kaggle |

Both the PowerPoint presentation and the Word document report are included in this repository.

## Project Deliverables

This project is presented through two written deliverables:

1. **PowerPoint Presentation** – A concise presentation of the project question, methodology, results, and conclusions.
2. **Word Document Report** – A detailed account of the analytical process, code implementation, model evaluation, findings, and business implications.

The Databricks notebooks provide the supporting code and demonstrate the practical steps taken throughout the project.

---

**Project:** Machine Learning for Financial Fraud Detection  
**Course:** Fintech – Berkeley College  
**Semester:** Fall 2026  
**Tools:** Databricks, SQL, Python, Scikit-learn
