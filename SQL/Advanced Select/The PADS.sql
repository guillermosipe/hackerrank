/* MySQL */
select concat(Name,"(",substr(Occupation,1,1),")") from OCCUPATIONS order by Name;
select concat("There are total ",count(*)," ",lower(Occupation),"s.") from OCCUPATIONS group by Occupation order by count(*),Occupation;
