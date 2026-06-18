# Hospital Data Analysis Using SQL (PostgreSQL)

## Project Overview
This project focuses on analyzing hospital operations data using PostgreSQL. The dataset contains information about hospitals, departments, doctors, patients, admission and discharge dates, and medical expenses. SQL queries were used to generate insights related to patient volume, department performance, hospital expenses, and healthcare operations.

---

## Dataset Information

The dataset contains the following fields:

- Hospital_Name
- Location
- Department
- Doctors_Count
- Patients_Count
- Admission_Date
- Discharge_Date
- Medical_Expenses

---

## Database Schema

```sql
CREATE TABLE hospital_data(
    Hospital_Name VARCHAR(50),
    Location VARCHAR(50),
    Department VARCHAR(50),
    Doctors_Count INT,
    Patients_Count INT,
    Admission_Date DATE,
    Discharge_Date DATE,
    Medical_Expenses NUMERIC(10,2)
);
```

---

## SQL Concepts Used

- Aggregate Functions (SUM, AVG)
- GROUP BY
- HAVING
- ORDER BY
- Window Functions
  - RANK()
  - DENSE_RANK()
- PARTITION BY
- Date Calculations
- Data Import using COPY Command

---

## Business Questions Solved

1. Total number of patients across all hospitals
2. Average doctor count per hospital
3. Top 3 departments with the highest patient count
4. Hospital with the highest medical expenses
5. Average medical expense per day by hospital
6. Total patients treated in each city
7. Average patient stay duration by department
8. Department with the least number of patients
9. Hospital with the highest patient count
10. Hospitals with expenses exceeding ₹500,000
11. Ranking hospitals by total medical expenses
12. Ranking departments within hospitals using DENSE_RANK()

---

## Key Insights

- Identified hospitals with the highest patient volume.
- Analyzed department-wise patient distribution.
- Evaluated hospital expenses and resource utilization.
- Compared department performance across hospitals.
- Generated healthcare insights using SQL analytics techniques.

---

## Tools & Technologies

- PostgreSQL
- SQL
- CSV Data Import
- Data Analysis
- Healthcare Analytics

---

## Project Thumbnail

(Add your thumbnail image here)

---

## Author

Sanjeev Kumar Yadav
Aspiring Data Analyst
