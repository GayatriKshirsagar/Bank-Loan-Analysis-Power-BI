SELECT * FROM bank_loan_data

SELECT COUNT(id) as Total_Loan_Applications FROM bank_loan_data

SELECT COUNT(id) as Month_To_Date FROM bank_loan_data
WHERE issue_date LIKE '%11' AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount) as Total_Funded_Amount FROM bank_loan_data

SELECT SUM(loan_amount) as MTD_Total_Funded_Amount FROM bank_loan_data
WHERE issue_date LIKE '%12' AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount) as PMTD_Total_Funded_Amount FROM bank_loan_data
WHERE issue_date LIKE '%11' AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) as Total_Amount_Received FROM bank_loan_data

SELECT SUM(total_payment) as MTD_Total_Amount_Received FROM bank_loan_data
WHERE issue_date LIKE '%12' AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) as PMTD_Total_Amount_Received FROM bank_loan_data
WHERE issue_date LIKE '%11' AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(int_rate), 4)*100 as Average_Interest_Rate FROM bank_loan_data

SELECT ROUND(AVG(int_rate), 4)*100 as MTD_Average_Interest_Rate FROM bank_loan_data
WHERE issue_date LIKE '%12' AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(int_rate), 4)*100 as PMTD_Average_Interest_Rate FROM bank_loan_data
WHERE issue_date LIKE '%11' AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti), 4) *100 AS MTD_Avg_DTI FROM bank_loan_data
WHERE issue_date LIKE '%12' AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti), 4) *100 AS PMTD_Avg_DTI FROM bank_loan_data
WHERE issue_date LIKE '%11' AND YEAR(issue_date) = 2021

SELECT distinct loan_status FROM bank_loan_data

-- Good Loan

SELECT 
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END))*100 
	/ 
	COUNT(id) as Good_Loan_Percentage 
FROM bank_loan_data

SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(total_payment) AS Good_Loan_Received_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- BAD LOAN

SELECT 
	(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END))*100 
	/ 
	COUNT(id) as Bad_Loan_Percentage 
FROM bank_loan_data

SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off'

SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'

SELECT SUM(total_payment) AS Bad_Loan_Received_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'

-- Loan Status Grid View

SELECT  
	loan_status,
	COUNT(id) AS Total_Loan_applications,
	SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount,
	AVG(int_rate * 100) AS Interest_Rate,
	AVG(dti * 100) AS Avg_DTI
FROM bank_loan_data
GROUP BY loan_status

-- MTD

SELECT  
	loan_status,
	SUM(total_payment) AS MTD_Total_Amount_Received,
	SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM bank_loan_data
WHERE issue_date LIKE '%12'
GROUP BY loan_status

-- Charts

SELECT * FROM bank_loan_data

-- Regional Analysis By State

SELECT 
	address_state,
	COUNT(id) AS Total_Loan_applications,
	SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data
GROUP BY address_state
ORDER BY COUNT(id) DESC

-- Loan Term Analysis

SELECT 
	term,
	COUNT(id) AS Total_Loan_applications,
	SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data
GROUP BY term
ORDER BY COUNT(id) DESC

-- Employee Length Analysis

SELECT 
	emp_length,
	COUNT(id) AS Total_Loan_applications,
	SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data
GROUP BY emp_length
ORDER BY COUNT(id) DESC

-- Loan Purpose Breakdown

SELECT 
	purpose,
	COUNT(id) AS Total_Loan_applications,
	SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data
GROUP BY purpose
ORDER BY COUNT(id) DESC

-- Home Ownership Analysis

SELECT 
	home_ownership,
	COUNT(id) AS Total_Loan_applications,
	SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY COUNT(id) DESC