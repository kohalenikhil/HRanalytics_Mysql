SELECT* FROM hr.hr_analytics;

-- 1 Write an sql query to find the details of employees under attrition having 5+ experience in between age grp of 27 to 35 ?

select * from hr_analytics
where age between 27 and 35 
and totalworkingyears >=5;

select count(*) from hr_analytics
where age between 27 and 35 
and totalworkingyears >=5;


-- 2 fetch the details of employees having maximum and minimum salary working in different departments who received less than 1300% salary hike

select department,
max(MonthlyIncome),
min(MonthlyIncome)
from hr_analytics
where PercentSalaryHike <1300
group by department
order by max(monthlyincome) desc;


-- 3 Calculate the average monthly income of all the employees who worked more than 3 years whose education background is medical ?

select avg(monthlyincome)
from hr_analytics
where YearsAtCompany>3 and 
educationfield = 'medical';


-- Identify the total no of sales and female employees under attrition whose marital status is married and havent received promotion in the last 2 years

select gender, count(empid)
from hr_analytics
where maritalstatus ='married'
and YearsSinceLastPromotion = 2
group by gender;


-- 5 Employees with max performance rating but no promotion for 4 years and above?

select *
from hr_analytics
where performancerating = (select max(performancerating)
from hr_analytics)
and YearsSinceLastPromotion >= 4;


