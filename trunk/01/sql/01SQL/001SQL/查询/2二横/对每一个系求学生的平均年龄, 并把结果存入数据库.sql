
/* 对每一个系求学生的平均年龄, 并把结果存入数据库 */

/*
use st

if exists(select name from sysobjects where name='AvgAgeSdeptView' and type='v')
	drop view avgagesdeptview
go */ /*
create view AvgAgeSdeptView(Sdept, avgAge) /* 这样做是错的, 因为结果并没有真正地存入数据库 */
as
select Sdept, avg(sage)
from student 
group by sdept
go*/


use st
if exists(select name from sysobjects where name='avgSdeptAge' and type='u')
	drop table avgSdeptAge
go
create table avgSdeptAge
	(Sdept char(10) not null primary key, 
	avgAge smallint
	)
go

insert into avgSdeptAge(Sdept, avgAge)
select Sdept, avg(sage)
from student
group by sdept
