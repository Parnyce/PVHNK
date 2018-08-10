
select top 1 k.id from
(select top 5 id from tbl_enquiryregistration order by id desc)as k
order by k.id asc


select min(k.id) from
(select top 5 id from tbl_enquiryregistration order by id desc)as k
--order by k.id asc

--With CTE
With CTE  As
(select ROW_NUMBER() OVER (ORDER BY fmd_annual_income DESC)ID,fmd_annual_income
from tbl_familymemberdetails 
--order by fmd_annual_income desc
)
select fmd_annual_income from CTE
where ID=5

--Without CTE & WithOUT SubQuery
select fmd_annual_income from tbl_familymemberdetails order by fmd_annual_income Desc
OFFSET 5 Rows
FETCH NEXT 1 ROW ONLY



--duplicate records with one field
select fmd_name,COUNT(fmd_name) from tbl_familymemberdetails 
GROUP BY fmd_name
HAVING COUNT(*)>1
 
 --duplicate records with more than one field
select fmd_name,fmd_age,COUNT(*) from tbl_familymemberdetails 
GROUP BY fmd_name,fmd_age
HAVING COUNT(*)>1