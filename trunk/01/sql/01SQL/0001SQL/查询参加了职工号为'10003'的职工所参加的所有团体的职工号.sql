
/* 查询参加了职工号为'10003'的职工所参加的所有团体的职工号 */
use jigongshetuan
select distinct jghao
from cjia a
where not exists(select *
	from cjia b
	where b.jghao='10003' and not exists(select *
		from cjia c
		where a.jghao=c.jghao and b.bhao=c.bhao))
go

select *
from jgong
where jghao in 
(select distinct jghao
from cjia a
where not exists(select *
	from cjia b
	where b.jghao='10003' and not exists(select *
		from cjia c
		where a.jghao=c.jghao and b.bhao=c.bhao))
)