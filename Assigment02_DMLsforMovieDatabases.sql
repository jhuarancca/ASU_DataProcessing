drop table if exists query1;

create table query1 as 
select g."name" as name,count(*) as moviecount
from hasagenre h,genres g
where h.genreid =g.genreid  
group by g."name"
order by 2 desc;

drop table if exists query2;

create table query2 as
select g."name" as name,avg(r.rating) as rating
from hasagenre h,genres g,ratings r 
where h.genreid =g.genreid  
and h.movieid =r.movieid 
group by g."name"
order by 2 desc;


drop table if exists query3;

create table query3 as
SELECT m.title as title, count(r.movieid) as CountOfRatings
FROM movies as m
JOIN ratings r
on m.movieid = r.movieid
group by m.title
having count(r.movieid) >= 10;


drop table if exists query4;

CREATE TABLE query4 AS
SELECT movieid AS movieid , title AS title
FROM movies
NATURAL JOIN genres
NATURAL JOIN hasagenre
WHERE genres.name='Comedy'
ORDER BY movieid ASC;


drop table if exists query5;

create table query5 as
select m.title as title,avg(r.rating) as average
from ratings r,movies m 
where m.movieid =r.movieid 
group by m.title;

drop table if exists query6;

create table query6 as
select avg(r.rating) as average
from ratings r,movies m, hasagenre h
where m.movieid =r.movieid 
and h.movieid =m.movieid 
and h.genreid=5;

drop table if exists query7;

create table query7 as
select avg(r.rating) as average
from ratings r,movies m
where m.movieid =r.movieid 
and m.movieid  in (select m.movieid 
						from ratings r,movies m, hasagenre h
						where m.movieid =r.movieid 
						and h.movieid =m.movieid 
						and h.genreid in (5))
and m.movieid  in (select m.movieid 
						from ratings r,movies m, hasagenre h
						where m.movieid =r.movieid 
						and h.movieid =m.movieid 
						and h.genreid in (14));
						
						
drop table if exists query8;

create table query8 as
select avg(r.rating) as average
from ratings r,movies m, hasagenre h
where m.movieid =r.movieid 
and h.movieid =m.movieid 
and h.genreid in (14)
and m.movieid not in (select m.movieid 
						from ratings r,movies m, hasagenre h
						where m.movieid =r.movieid 
						and h.movieid =m.movieid 
						and h.genreid in (5));


drop table if exists query9;

create table query9 as
select m.movieid  as movieid,r.rating as rating
from ratings r,movies m
where m.movieid =r.movieid 
and r.userid = :v1;





--select * from genres g 

--5	Comedy
--14	Romance
