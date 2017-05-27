/* MySQL */
select distinct f1.x,f1.y from (select x,y,count(*) as conteo from functions f group by x,y) f1 join functions f2 on (f1.x=f2.y and f2.x=f1.y) where f1.x<f1.y or f1.conteo>1 order by f1.x;
