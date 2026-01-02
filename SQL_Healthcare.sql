use project2;


/** 1 No of Patients **/
SELECT COUNT(*) FROM patients;


/** 2 No of Doctors **/
SELECT COUNT(*) FROM doctors;


/** 3 No of Visits**/
SELECT COUNT(*) FROM visits;


/** 4 No of Lab Results**/
SELECT COUNT(*) FROM labresults;


/** 5 Patients by Gender**/
SELECT Gender, COUNT(*) AS Count FROM patients GROUP BY Gender;


/** 6 Patient first name or last name is NULL**/
SELECT * FROM patients WHERE 'First Name' IS NULL OR LastName IS NULL;


/** 7 Visit Type or Visit Date is NULL**/
SELECT * FROM visits WHERE 'Visit Type' IS NULL OR 'Visit Date' IS NULL;


/** 8 Test Name or Test Result is NULL**/
SELECT * FROM labresults WHERE 'Test Name' IS NULL OR 'Test Result' IS NULL;


/** 9 Avgerage Patient Age **/
SELECT round(avg(Age),2) as Age from patients;


/** 10 Total Treatment Cost**/
SELECT SUM(Cost) / 1000000 AS TotalCost_Millions FROM treatments;


/** 11 Most Common Diagnosis**/
SELECT Diagnosis , COUNT(*) AS DiagnosisCount FROM  visits GROUP BY Diagnosis ORDER BY DiagnosisCount DESC LIMIT 5;


/** 12 Top 5 Medications **/
SELECT `Prescribed Medications`, COUNT(*) AS MedicationCount FROM visits GROUP BY `Prescribed Medications` ORDER BY MedicationCount DESC LIMIT 5;

/** 13 Chronic Condition patients**/
SELECT COUNT(*) AS ChronicPatients FROM patients WHERE `Chronic Conditions`!= 'None';


/** 14 Specialty wise doctors count**/
SELECT 
  Specialty,
  COUNT(*) AS DoctorCount,
  ROUND(COUNT(*) / (SELECT COUNT(*) FROM doctors) * 100, 2) AS Percentage
FROM doctors GROUP BY Specialty ORDER BY DoctorCount DESC;


/** 15 Statewise patients count**/
SELECT  State,
    COUNT(*) AS PatientCount
FROM patients GROUP BY State ORDER BY PatientCount DESC;


/** 16 Test Result %**/
SELECT `Test Result`,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM labresults), 2) AS Percentage
FROM labresults GROUP BY `Test Result`;


/** 17 Number of Visits that Required Follow-Up**/
SELECT COUNT(*) AS `Follow Up Required` FROM visits WHERE `Follow Up Required` = 'Yes';


/** 18 Data Consistency Check**/
SELECT 'v.Visit ID', 'v.Patient ID', 'p.Patient ID'
FROM visits v
LEFT JOIN patients p ON 'v.Patient ID' = 'p.Patient ID'
WHERE 'p.Patient ID' IS NULL;  



/** 19 Duplicate Records Check**/
SELECT 'Patient ID', COUNT(*)
FROM patients
GROUP BY 'Patient ID'
HAVING COUNT(*) > 1;


/** 20 Treatment type**/
SELECT 
	`Treatment Type`,
  COUNT(*) AS TreatmentCount,
  ROUND(COUNT(*) / (SELECT COUNT(*) FROM treatments) * 100, 2) AS Percentage
FROM treatments
GROUP BY `Treatment Type`
ORDER BY TreatmentCount DESC;


