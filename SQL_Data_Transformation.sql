USE capstone_cohort1;
-- CREATE TABLE
CREATE TABLE loan_applications (
    loan_id INT PRIMARY KEY,
    no_of_dependents INT,
    education VARCHAR(50),
    gender VARCHAR(10),
    self_employed VARCHAR(10),
    income_annum DECIMAL(10, 2),
    loan_amount DECIMAL(10, 2),
    loan_term INT,
    cibil_score INT,
    residential_assets_value DECIMAL(10, 2),
    commercial_assets_value DECIMAL(10, 2),
    luxury_assets_value DECIMAL(10, 2),
    bank_asset_value DECIMAL(10, 2),
    loan_status VARCHAR(20)
);
-- IMPORT DATA USING TABLE DATA IMPORT WIZARD

-- CHECK THE TABLE
SELECT * FROM loan_applications;

-- DATA CLEANING AND MANIPULATION
DROP TABLE IF EXISTS loan_application_details;

CREATE TABLE loan_application_details 
AS
SELECT 
	loan_id,	 
    no_of_dependents,	
    TRIM(gender) AS gender,	 
    TRIM(education) AS education,	 
    TRIM(self_employed) AS self_employed,	 
    ROUND(income_annum,2) AS income_annum,
	CASE
        WHEN income_annum >= 0 AND income_annum <= 999999 THEN '0-10 Lacs'
        WHEN income_annum >= 1000000 AND income_annum <= 1999999 THEN '10-20 Lacs'
        WHEN income_annum >= 2000000 AND income_annum <= 2999999 THEN '20-30 Lacs'
        WHEN income_annum >= 3000000 AND income_annum <= 3999999 THEN '30-40 Lacs'
        WHEN income_annum >= 4000000 AND income_annum <= 4999999 THEN '40-50 Lacs'
        WHEN income_annum >= 5000000 AND income_annum <= 5999999 THEN '50-60 Lacs'
        WHEN income_annum >= 6000000 AND income_annum <= 6999999 THEN '60-70 Lacs'
        WHEN income_annum >= 7000000 AND income_annum <= 7999999 THEN '70-80 Lacs'
        WHEN income_annum >= 8000000 AND income_annum <= 8999999 THEN '80-90 Lacs'
        WHEN income_annum >= 9000000 AND income_annum <= 9999999 THEN '90 Lacs+'
        ELSE 'Unknown' -- Handle any other cases if necessary
    END AS income_annum_group_lacs,
    ROUND(loan_amount,2) AS loan_amount,
	CASE
        WHEN loan_amount >= 0 AND loan_amount <= 4999999 THEN '0-0.5'
        WHEN loan_amount >= 5000000 AND loan_amount <= 9999999 THEN '0.5-1'
        WHEN loan_amount >= 10000000 AND loan_amount <= 14999999 THEN '1-1.5'
        WHEN loan_amount >= 15000000 AND loan_amount <= 19999999 THEN '1.5-2'
        WHEN loan_amount >= 20000000 AND loan_amount <= 24999999 THEN '2-2.5'
        WHEN loan_amount >= 25000000 AND loan_amount <= 29999999 THEN '2.5-3'
        WHEN loan_amount >= 30000000 AND loan_amount <= 34999999 THEN '3-3.5'
        WHEN loan_amount >= 35000000 AND loan_amount <= 39999999 THEN '3.5+'
        ELSE 'Unknown' -- Handle any other cases if necessary
    END AS loan_amount_group,
    loan_term,	 
    cibil_score,
    CASE
        WHEN cibil_score BETWEEN 300 AND 549 THEN 'Low'
        WHEN cibil_score BETWEEN 550 AND 649 THEN 'Fair'
        WHEN cibil_score BETWEEN 650 AND 749 THEN 'Good'
        WHEN cibil_score BETWEEN 750 AND 900 THEN 'Excellent'
        ELSE 'Unknown' -- Handle any other cases if necessary
    END AS cibil_score_category,
    ROUND(residential_assets_value,2) AS residential_assets_value,
	CASE
		WHEN residential_assets_value < 0 THEN 'negative_value'
        WHEN residential_assets_value = 0 THEN 'zero_value'
        WHEN residential_assets_value >= 1 AND residential_assets_value <= 4999999 THEN '0-0.5'
        WHEN residential_assets_value >= 5000000 AND residential_assets_value <= 9999999 THEN '0.5-1'
        WHEN residential_assets_value >= 10000000 AND residential_assets_value <= 14999999 THEN '1-1.5'
        WHEN residential_assets_value >= 15000000 AND residential_assets_value <= 19999999 THEN '1.5-2'
        WHEN residential_assets_value >= 20000000 AND residential_assets_value <= 24999999 THEN '2-2.5'
        WHEN residential_assets_value >= 25000000 AND residential_assets_value <= 29999999 THEN '2.5-3'
        WHEN residential_assets_value >= 30000000 AND residential_assets_value <= 34999999 THEN '3-3.5'
        WHEN residential_assets_value >= 35000000 AND residential_assets_value <= 39999999 THEN '3.5+'
        ELSE 'Unknown' -- Handle any other cases if necessary
    END AS residential_assets_value_group,
    ROUND(commercial_assets_value,2) AS commercial_assets_value,
	CASE
		WHEN commercial_assets_value < 0 THEN 'negative_Value'
        WHEN commercial_assets_value = 0 THEN 'zero_value'
        WHEN commercial_assets_value >= 1 AND commercial_assets_value <= 4999999 THEN '0-0.5'
        WHEN commercial_assets_value >= 5000000 AND commercial_assets_value <= 9999999 THEN '0.5-1'
        WHEN commercial_assets_value >= 10000000 AND commercial_assets_value <= 14999999 THEN '1-1.5'
        WHEN commercial_assets_value >= 15000000 AND commercial_assets_value <= 19999999 THEN '1.5-2'
        WHEN commercial_assets_value >= 20000000 AND commercial_assets_value <= 24999999 THEN '2-2.5'
        WHEN commercial_assets_value >= 25000000 AND commercial_assets_value <= 29999999 THEN '2.5-3'
        WHEN commercial_assets_value >= 30000000 AND commercial_assets_value <= 34999999 THEN '3-3.5'
        WHEN commercial_assets_value >= 35000000 AND commercial_assets_value <= 39999999 THEN '3.5+'
        ELSE 'Unknown' -- Handle any other cases if necessary
    END AS commercial_assets_value_group,
	ROUND(luxury_assets_value,2) AS luxury_assets_value,
	CASE
		WHEN luxury_assets_value < 0 THEN 'negative_Value'
        WHEN luxury_assets_value = 0 THEN 'zero_value'
        WHEN luxury_assets_value >= 1 AND luxury_assets_value <= 4999999 THEN '0-0.5'
        WHEN luxury_assets_value >= 5000000 AND luxury_assets_value <= 9999999 THEN '0.5-1'
        WHEN luxury_assets_value >= 10000000 AND luxury_assets_value <= 14999999 THEN '1-1.5'
        WHEN luxury_assets_value >= 15000000 AND luxury_assets_value <= 19999999 THEN '1.5-2'
        WHEN luxury_assets_value >= 20000000 AND luxury_assets_value <= 24999999 THEN '2-2.5'
        WHEN luxury_assets_value >= 25000000 AND luxury_assets_value <= 29999999 THEN '2.5-3'
        WHEN luxury_assets_value >= 30000000 AND luxury_assets_value <= 34999999 THEN '3-3.5'
        WHEN luxury_assets_value >= 35000000 AND luxury_assets_value <= 39999999 THEN '3.5+'
        ELSE 'Unknown' -- Handle any other cases if necessary
    END AS luxury_assets_value_group,
	ROUND(bank_asset_value,2) AS bank_asset_value,
	CASE
		WHEN bank_asset_value < 0 THEN 'negative_value'
        WHEN bank_asset_value = 0 THEN 'zero_value'
        WHEN bank_asset_value >= 1 AND bank_asset_value <= 4999999 THEN '0-0.5'
        WHEN bank_asset_value >= 5000000 AND bank_asset_value <= 9999999 THEN '0.5-1'
        WHEN bank_asset_value >= 10000000 AND bank_asset_value <= 14999999 THEN '1-1.5'
        WHEN bank_asset_value >= 15000000 AND bank_asset_value <= 19999999 THEN '1.5-2'
        WHEN bank_asset_value >= 20000000 AND bank_asset_value <= 24999999 THEN '2-2.5'
        WHEN bank_asset_value >= 25000000 AND bank_asset_value <= 29999999 THEN '2.5-3'
        WHEN bank_asset_value >= 30000000 AND bank_asset_value <= 34999999 THEN '3-3.5'
        WHEN bank_asset_value >= 35000000 AND bank_asset_value <= 39999999 THEN '3.5+'
        ELSE 'Unknown' -- Handle any other cases if necessary
    END AS bank_asset_value_group,
    TRIM(loan_status) AS loan_status
FROM loan_applications;

SELECT * FROM loan_application_details;

-- FIND THE TOTAL NO. OF APPLICANTS WITH BREAKDOWN BY APPROVED AND REJECTED. ALSO, CALCULATE THE APPROVAL RATE.
SELECT *, ROUND((approved_applications/total_applications)*100,2) AS approval_rate
FROM
(SELECT 
	COUNT(*) AS total_applications,
    SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) AS approved_applications,
    SUM(CASE WHEN loan_status = 'Rejected' THEN 1 ELSE 0 END) AS rejected_applications
FROM loan_application_details) a;


-- Create a cross-tabulation of loan status by gender, education, and self employed level:
-- gender
SELECT
    'Approved' AS "loan_status/gender",
    SUM(CASE WHEN gender = 'Female' AND loan_status = 'Approved' THEN 1 ELSE 0 END) AS "Female",
    SUM(CASE WHEN gender = 'Male' AND loan_status = 'Approved' THEN 1 ELSE 0 END) AS "Male"
FROM loan_application_details
UNION ALL
SELECT
    'Rejected' AS "loan_status/gender",
    SUM(CASE WHEN gender = 'Female' AND loan_status = 'Rejected' THEN 1 ELSE 0 END) AS "Female",
    SUM(CASE WHEN gender = 'Male' AND loan_status = 'Rejected' THEN 1 ELSE 0 END) AS "Male"
FROM loan_application_details;
-- education
SELECT
    'Approved' AS "loan_status/education",
    SUM(CASE WHEN education = 'Graduate' AND loan_status = 'Approved' THEN 1 ELSE 0 END) AS "Graduate",
    SUM(CASE WHEN education = 'Not Graduate' AND loan_status = 'Approved' THEN 1 ELSE 0 END) AS "Not Graduate",
    SUM(CASE WHEN education = 'Post Graduate' AND loan_status = 'Approved' THEN 1 ELSE 0 END) AS "Post Graduate"
FROM loan_application_details
UNION ALL
SELECT
    'Rejected' AS "loan_status/education",
    SUM(CASE WHEN education = 'Graduate' AND loan_status = 'Rejected' THEN 1 ELSE 0 END) AS "Graduate",
    SUM(CASE WHEN education = 'Not Graduate' AND loan_status = 'Rejected' THEN 1 ELSE 0 END) AS "Not Graduate",
    SUM(CASE WHEN education = 'Post Graduate' AND loan_status = 'Rejected' THEN 1 ELSE 0 END) AS "Post Graduate"
FROM loan_application_details;

-- self employed
SELECT
    'Approved' AS "loan_status/self-employed",
    SUM(CASE WHEN self_employed = 'No' AND loan_status = 'Approved' THEN 1 ELSE 0 END) AS "No",
    SUM(CASE WHEN self_employed = 'Yes' AND loan_status = 'Approved' THEN 1 ELSE 0 END) AS "Yes"
FROM loan_application_details
UNION ALL
SELECT
    'Rejected' AS "loan_status/self-employed",
    SUM(CASE WHEN self_employed = 'No' AND loan_status = 'Rejected' THEN 1 ELSE 0 END) AS "No",
    SUM(CASE WHEN self_employed = 'Yes' AND loan_status = 'Rejected' THEN 1 ELSE 0 END) AS "Yes"
FROM loan_application_details;

-- create cibil score distribuition 
SELECT cibil_score_category, COUNT(1) AS total_applicants
FROM loan_application_details
GROUP BY cibil_score_category
;

SELECT
    'Approved' AS "loan_status/cibil_score",
    SUM(CASE WHEN cibil_score_category = 'Excellent' AND loan_status = 'Approved' THEN 1 ELSE 0 END) AS "Excellent",
    SUM(CASE WHEN cibil_score_category = 'Good' AND loan_status = 'Approved' THEN 1 ELSE 0 END) AS "Good",
    SUM(CASE WHEN cibil_score_category = 'Fair' AND loan_status = 'Approved' THEN 1 ELSE 0 END) AS "Fair",
	SUM(CASE WHEN cibil_score_category = 'Low' AND loan_status = 'Approved' THEN 1 ELSE 0 END) AS "Low"
FROM loan_application_details
UNION ALL
SELECT
    'Rejected' AS "loan_status/cibil_score",
    SUM(CASE WHEN cibil_score_category = 'Excellent' AND loan_status = 'Rejected' THEN 1 ELSE 0 END) AS "Excellent",
    SUM(CASE WHEN cibil_score_category = 'Good' AND loan_status = 'Rejected' THEN 1 ELSE 0 END) AS "Good",
    SUM(CASE WHEN cibil_score_category = 'Fair' AND loan_status = 'Rejected' THEN 1 ELSE 0 END) AS "Fair",
	SUM(CASE WHEN cibil_score_category = 'Low' AND loan_status = 'Rejected' THEN 1 ELSE 0 END) AS "Low"
FROM loan_application_details;
