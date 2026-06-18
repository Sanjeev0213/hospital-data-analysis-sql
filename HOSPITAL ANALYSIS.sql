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
SELECT *FROM hospital_data;
SET datestyle = 'ISO, DMY';

COPY 
hospital_data(Hospital_Name,Location,	Department,	Doctors_Count,	Patients_Count,	Admission_Date,	Discharge_Date,	Medical_Expenses)
FROM 'D:/DATA ANALYTICS/Hospital_Data.csv'
DELIMITER ','
CSV HEADER;

--Write an SQL query to find the total number of patients across all hospitals
SELECT SUM(patients_count) AS total_patients 
FROM hospital_data;

-- Retrieve the average count of doctors available in each hospital.
SELECT hospital_name, AVG(doctors_count) AS avg_doctors
FROM hospital_data
GROUP BY hospital_name;

--Find the top 3 hospital departments that have the highest number of patients
SELECT  hospital_name,department,
       SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY hospital_name,department
ORDER BY total_patients DESC LIMIT 3;

--Identify the hospital that recorded the highest medical expenses
SELECT hospital_name, SUM(medical_expenses) AS total_expense FROM hospital_data
GROUP  BY hospital_name
ORDER BY total_expense DESC LIMIT 1;

--Calculate the average medical expenses per day for each hospital.
SELECT hospital_name, AVG(medical_expenses / (discharge_date - admission_date) ) AS avg_expense_per_day
FROM hospital_data
GROUP BY hospital_name;

--Count the total number of patients treated in each city.
SELECT Location, SUM(Patients_Count) AS total_patient FROM hospital_data
GROUP BY Location;

--Calculate the average number of days patients spend in each department.
SELECT department,
 AVG(discharge_date - admission_date) AS avg_stay_days
FROM hospital_data
GROUP BY department;

--Find the department with the least number of patients.
SELECT department , SUM(patients_count) AS total_patient
FROM hospital_data
GROUP BY department
ORDER  BY total_patient ASC LIMIT 1;

--Which hospital treated the highest number of patients?
SELECT hospital_name,
 SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY hospital_name
ORDER BY total_patients DESC
LIMIT 1;

--Find hospitals where total expenses exceed ₹500,000
SELECT hospital_name,
SUM(medical_expenses) AS total_expenses
FROM hospital_data
GROUP BY hospital_name
HAVING SUM(medical_expenses) > 500000;

--Rank hospitals based on total medical expenses.
SELECT hospital_name, SUM(medical_expenses) AS total_expenses,
 RANK() OVER(ORDER BY SUM(medical_expenses) DESC ) AS hospital_rank
FROM hospital_data
GROUP BY hospital_name;

--Rank departments within each hospital based on patient count
SELECT hospital_name, department, SUM(patients_count) AS total_patients,
DENSE_RANK() OVER(PARTITION BY hospital_name ORDER BY SUM(patients_count) DESC ) AS dept_rank
FROM hospital_data
GROUP BY hospital_name, department;

