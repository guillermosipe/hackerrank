/* MySQL */
set @doctor:=0,@professor:=0,@singer:=0,@actor:=0;
select min(doctor),min(profesor),min(singer),min(actor) from
(select
    case when OCCUPATION='Doctor' then name else NULL end as doctor,
    case when OCCUPATION='Professor' then name  else NULL end as profesor,
    case when OCCUPATION='Singer' then name  else NULL end as singer,
    case when OCCUPATION='Actor' then name  else NULL end as actor,
    case when OCCUPATION='Doctor' then @doctor:=@doctor+1
         when OCCUPATION='Professor' then @professor:=@professor+1
         when OCCUPATION='Singer' then @singer:=@singer+1
         when OCCUPATION='Actor' then @actor:=@actor+1 end as id
from OCCUPATIONS order by name) as temporal group by temporal.id;
