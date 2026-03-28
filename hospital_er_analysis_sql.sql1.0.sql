create Database hospita_er_data;
use  hospita_er_data;
select * from er_data;

--  data Cleaning

-- convert all the  column in the  form of snake_case
ALTER TABLE er_data
CHANGE COLUMN `ï»¿Patient Id` patient_id VARCHAR(50);

ALTER TABLE er_datab
CHANGE COLUMN `Patient Admission Date` patient_admission_date VARCHAR(50);

ALTER TABLE er_data CHANGE COLUMN `Patient First Inital` patient_first_initial VARCHAR(50);
ALTER TABLE er_data CHANGE COLUMN `Patient First Inital` patient_first_initial VARCHAR(50);
ALTER TABLE er_data CHANGE COLUMN `Patient Last Name` patient_last_name VARCHAR(50);
ALTER TABLE er_data CHANGE COLUMN `Patient Gender` patient_gender VARCHAR(20);
ALTER TABLE er_data CHANGE COLUMN `Patient Age` patient_age VARCHAR(20);
ALTER TABLE er_data CHANGE COLUMN `Patient Race` patient_race VARCHAR(50);
ALTER TABLE er_data CHANGE COLUMN `Department Referral` department_referral VARCHAR(100);
ALTER TABLE er_data CHANGE COLUMN `Patient Satisfaction Score` patient_satisfaction_score VARCHAR(20);
ALTER TABLE er_data CHANGE COLUMN `Patient Waittime` patient_waittime VARCHAR(20);
ALTER TABLE er_data CHANGE COLUMN `Patients CM` patients_cm VARCHAR(50);

select * from er_data;

 -- Add New Columns
 ALTER TABLE er_data
ADD COLUMN year INT,
ADD COLUMN month INT,
ADD COLUMN day INT,
ADD COLUMN hour INT,
ADD COLUMN month_name VARCHAR(20),
ADD COLUMN weekday VARCHAR(20),
ADD COLUMN age_group VARCHAR(20),
ADD COLUMN wait_bucket VARCHAR(20),
ADD COLUMN is_repeat_patient BOOLEAN;

select * from er_data;

-- fill  this column by patient_admission_date columns;
SET SQL_SAFE_UPDATES = 0;
UPDATE er_data
SET patient_admission_date =
    STR_TO_DATE(patient_admission_date, '%d-%m-%Y %H:%i')
WHERE patient_admission_date IS NOT NULL;

UPDATE er_data
SET 
    year = YEAR(patient_admission_date),
    month = MONTH(patient_admission_date),
    day = DAY(patient_admission_date),
    hour = HOUR(patient_admission_date),
    month_name = MONTHNAME(patient_admission_date),
    weekday = DAYNAME(patient_admission_date);
    
    
SET SQL_SAFE_UPDATES = 0;
    UPDATE er_data
SET age_group = 
    CASE 
        WHEN patient_age BETWEEN 0 AND 12 THEN 'Child'
        WHEN patient_age BETWEEN 13 AND 17 THEN 'Teen'
        WHEN patient_age BETWEEN 18 AND 35 THEN 'Adult'
        WHEN patient_age BETWEEN 36 AND 60 THEN 'Middle-Aged'
        WHEN patient_age > 60 THEN 'Senior'
    END;
    
    SET SQL_SAFE_UPDATES = 0;
UPDATE er_data
SET wait_bucket = 
    CASE 
        WHEN patient_waittime < 30 THEN '<30'
        WHEN patient_waittime BETWEEN 30 AND 60 THEN '30-60'
        WHEN patient_waittime BETWEEN 61 AND 120 THEN '60-120'
        ELSE '>120'
    END;
    select * from er_data;
    
    UPDATE er_data t1
JOIN (
    SELECT patient_id
    FROM er_data
    GROUP BY patient_id
    HAVING COUNT(*) > 1
) t2
ON t1.patient_id = t2.patient_id
SET t1.is_repeat_patient = TRUE;

UPDATE er_data
SET is_repeat_patient = FALSE
WHERE is_repeat_patient IS NULL;

select * from er_data;

-- ------------Insight--------------
-- KPI
-- Total Patient 
select count(distinct(patient_id)) as Total_Patient from er_data;  # Total Patient:9216

-- Avarage Wait Time
select round(avg(patient_waittime),2) as Avg_wait_time from er_data; -- Avarage Wait Time: 35.26,

--  Avg Satisfaction 
select round(avg(patient_satisfaction_score),2) Avg_Satisfaction from er_data where patient_satisfaction_score is not null ;  

-- Repeat patient 
select count(*) from  er_data where is_repeat_patient = True; # we obesevered that we have no any  repeated patient 

-- Total No of patient who are referred to other dept  
select count(department_referral) as Patient_Referred from er_data where department_referral <> "None";
-- Total No of patient who are referred to other dept =3816 


-- age_group Distribution 
select  age_group ,count(patient_id) as Patient_count from er_data
  group by age_group order by patient_count asc  ;

-- Gender Distribution
select patient_gender,count(patient_id) as  patient_count from er_data 
group by patient_gender order by patient_count asc;

-- department_referral
select department_referral,count(patient_id)  as  patient_count from  er_data 
group by department_referral 
order by patient_count asc;
 
 -- Wait bukect vs Satisfaction
select wait_bucket,count(patient_id)  as patient_count from er_data
group by wait_bucket order by patient_count asc;

select wait_bucket, round(avg(patient_satisfaction_score),2)  as avg_PSS from er_data
group by wait_bucket order by avg_pss asc;

-- Avg Wait Time by Age Group
SELECT age_group, 
       round(AVG(patient_waittime),2) AS avg_waittime
FROM er_data
GROUP BY age_group
ORDER BY avg_waittime desc;

-- Satisfaction by Dept 
SELECT department_referral,
       ROUND(AVG(patient_satisfaction_score), 2) AS Avg_SS
FROM er_data
WHERE patient_satisfaction_score IS NOT NULL
GROUP BY department_referral
ORDER BY Avg_SS DESC;

--  ----------- Time Trend analyze-------------

--  monthly patient trend
select year ,month_name ,count(distinct(patient_id)) as Patient_count from er_data
group by year ,month, month_name 
order by year ;

 -- Weekly patient trend
select weekday ,count(distinct(patient_id)) as Patient_count from er_data
group by  weekday 
order by weekday;

 -- Hourly patient trend
 select hour,count(distinct(patient_id)) as  Patient_count from er_data
 group by hour
 order by patient_count desc ;
 
 SELECT 
    hour,
    COUNT(DISTINCT patient_id) AS patient_count,
    RANK() OVER (ORDER BY COUNT(DISTINCT patient_id) DESC) AS rank_by_patients
FROM er_data
GROUP BY hour;

-- -------------  thankyou and happy Learning------------------------ 

