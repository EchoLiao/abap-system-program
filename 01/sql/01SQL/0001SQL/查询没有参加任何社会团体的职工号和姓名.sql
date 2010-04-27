
/* 查询没有参加任何社会团体的职工号和姓名 */
use jigongshetuan
select jghao, xming
from jgong
where jghao not in (select jghao
	from cjia )
go

select *
from jgong
