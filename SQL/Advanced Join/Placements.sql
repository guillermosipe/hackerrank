/* MySQL */
select s.name from (Students s join Packages ps on s.id=ps.id) join friends f on s.id=f.id join (Students bf join Packages pf on bf.id=pf.id) on bf.id=f.friend_id where ps.salary<pf.salary order by pf.salary asc;
