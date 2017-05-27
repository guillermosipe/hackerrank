/* MySQL */
select
SS.contest_id,SS.hacker_id,SS.name,SS.sumts,SS.sumtas,VS.sumtv,VS.sumtuv
from
(select Con_1.contest_id,
Con_1.hacker_id,
Con_1.name,
sum(IFNULL(S_S_1.total_submissions,0)) as sumts,
sum(IFNULL(S_S_1.total_accepted_submissions,0)) as sumtas
from Contests Con_1
join Colleges Col_1 on Con_1.contest_id=Col_1.contest_id
join Challenges Cha_1 on Col_1.college_id = Cha_1.college_id
left join Submission_Stats S_S_1 on Cha_1.challenge_id=S_S_1.challenge_id
group by Con_1.contest_id,Con_1.hacker_id) as SS join

(select Con_2.contest_id,
Con_2.hacker_id,
Con_2.name,
sum(IFNULL(V_S_2.total_views,0)) as sumtv,
sum(IFNULL(V_S_2.total_unique_views,0)) as sumtuv
from Contests Con_2
join Colleges Col_2 on Con_2.contest_id=Col_2.contest_id
join Challenges Cha_2 on Col_2.college_id = Cha_2.college_id
left join View_Stats V_S_2 on Cha_2.challenge_id=V_S_2.challenge_id
group by Con_2.contest_id,Con_2.hacker_id) as VS
on SS.hacker_id = VS.hacker_id
where SS.sumts>0 and SS.sumtas>0 and VS.sumtv>0 and VS.sumtuv;
