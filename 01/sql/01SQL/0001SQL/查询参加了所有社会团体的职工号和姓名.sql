
/* 查询参加了所有社会团体的职工号和姓名 */
/* 即: 没有一个社会团体是xx职工不参加的 */
use jigongshetuan
select jghao, xming
from jgong
where not exists(select *
	from shtti
	where not exists(select *
		from cjia
		where jgong.jghao=cjia.jghao and cjia.bhao=shtti.bhao ))
go

select distinct a.jghao, xming
from cjrqkuang a
where not exists(select *
	from cjrqkuang b
	where not exists(select *
		from cjrqkuang c
		where a.jghao=c.jghao and b.stbhao=c.stbhao ))
go