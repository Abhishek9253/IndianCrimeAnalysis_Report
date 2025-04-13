--------------------------------------------------
-- Indian Crime Analysis Project
--------------------------------------------------- 

-- Change DataBase:
use indiancrimes;

-- Importing table from table wizzard

Select * from crimes;

------------------------------------------------------
-- Check for missing or null values
select 
	* 
from crimes
where STATE is null 
or DISTRICT is null
or Year is null;

-- No null values found
------------------------------------------------------

-- Check duplicates value 
Select
	STATE, DISTRICT, Year, 
	count(*)
from crimes
group by STATE, DISTRICT, Year
	having count(*)>1;
------------------------------------------------------

-- Total crimes per year from 2001 to 2013:
Select
	Year,
	sum(MURDER+RAPE+KIDNAPPING+DACOITY+BURGLARY+THEFT+RIOTS+ROBBERY+DOWRY+ASSAULT_WOMEN+IMPORT_GIRLS) AS Total_Crimes
from crimes
group by Year
order by Year;
-------------------------------------------------------

-- Total crimes by state from 2001 to 2003:
Select
	State,
	sum(MURDER+RAPE+KIDNAPPING+DACOITY+BURGLARY+THEFT+RIOTS+ROBBERY+DOWRY+ASSAULT_WOMEN+IMPORT_GIRLS) AS Total_Crimes
from crimes
group by State
order by 2 desc;
---------------------------------------------------------

-- Total crimes by district:
Select
	District,
	sum(MURDER+RAPE+KIDNAPPING+DACOITY+BURGLARY+THEFT+RIOTS+ROBBERY+DOWRY+ASSAULT_WOMEN+IMPORT_GIRLS) AS Total_Crimes
from crimes
group by District
order by 2 desc;
---------------------------------------------------------

-- Total of each crime type:
Select
	sum(MURDER) as MURDER,
    sum(RAPE) as RAPE,
    sum(KIDNAPPING) as KIDNAPPING,
    sum(DACOITY) as DACOITY,
    sum(BURGLARY) as BURGLARY,
    sum(THEFT) as THEFT,
    sum(RIOTS) as RIOTS,
    sum(ROBBERY) as ROBBERY,
    sum(DOWRY) as DOWRY,
    sum(ASSAULT_WOMEN) as ASSAULT_WOMEN,
    sum(IMPORT_GIRLS) as IMPORT_GIRLS
from crimes;
-----------------------------------------------------------

-- Year wise rape cases for Assam
Select
	Year,
    sum(RAPE) as Rape_Cases
from crimes
where STATE='ASSAM'
group by Year
order by Year;
-----------------------------------------------------------

-- District with Highest rape cases
Select 
	District,
    sum(RAPE) as Rape_Cases
from crimes
group by District
order by Rape_Cases desc
limit 1;
---------------------------------------------------------------

-- Most Dangerous State:
Select 
	STATE,
    sum(MURDER+RAPE+KIDNAPPING+DACOITY+BURGLARY+THEFT+RIOTS+ROBBERY+DOWRY+ASSAULT_WOMEN+IMPORT_GIRLS) AS Total_Crimes
from crimes
group by STATE
order by Total_Crimes desc
limit 1;
-----------------------------------------------------------------

-- Compare crimes between two years (2001,2013):
with cte as(
Select 
	State,
    sum(case when Year='2001'then MURDER+RAPE+KIDNAPPING+DACOITY+BURGLARY+THEFT+RIOTS+ROBBERY+DOWRY+ASSAULT_WOMEN+IMPORT_GIRLS end) as 2001_year,
    sum(case when Year='2013'then MURDER+RAPE+KIDNAPPING+DACOITY+BURGLARY+THEFT+RIOTS+ROBBERY+DOWRY+ASSAULT_WOMEN+IMPORT_GIRLS end) as 2013_year
from crimes
group by State
)
Select 
	state,
    2001_year,
    2013_year,
    round(((2013_year-2001_year)/2001_year)*100,2) as Inc_percentage
from cte
order by 3 desc;
------------------------------------------------------------------

-- Crime trend by year and crime type
Select
	Year,
    sum(MURDER) as MURDER,
    sum(RAPE) as RAPE,
    sum(KIDNAPPING) as KIDNAPPING,
    sum(DACOITY) as DACOITY,
    sum(BURGLARY) as BURGLARY,
    sum(THEFT) as THEFT,
    sum(RIOTS) as RIOTS,
    sum(ROBBERY) as ROBBERY,
    sum(DOWRY) as DOWRY,
    sum(ASSAULT_WOMEN) as ASSAULT_WOMEN,
    sum(IMPORT_GIRLS) as IMPORT_GIRLS
from crimes
group by Year
order by Year;
-----------------------------------------------------------------

-- Total 5 state for each crime type:
Select
	State,
	sum(MURDER) as MURDER,
    sum(RAPE) as RAPE,
    sum(KIDNAPPING) as KIDNAPPING,
    sum(DACOITY) as DACOITY,
    sum(BURGLARY) as BURGLARY,
    sum(THEFT) as THEFT,
    sum(RIOTS) as RIOTS,
    sum(ROBBERY) as ROBBERY,
    sum(DOWRY) as DOWRY,
    sum(ASSAULT_WOMEN) as ASSAULT_WOMEN,
    sum(IMPORT_GIRLS) as IMPORT_GIRLS
from crimes
group by State
order by 4 desc
limit 5;
-------------------------------------------------------------

-- Multi Crime Analysis: (Rape and Kidnapping):
Select 
	State,
    sum(RAPE + KIDNAPPING) as Total_Cases
from crimes
group by State
order by Total_Cases desc
limit 5;
--------------------------------------------------------------

    



    