
use jigongshetuan
/* 查询参加篮球和足球的职工号和姓名 */

select jghao,xming
from cjrqkuang
where stmcheng='篮球' and 
	jghao in (select jghao
		from cjrqkuang
		where stmcheng='足球')
go

select cjia.jghao, xming
from jgong ,shtti,cjia
where jgong.jghao=cjia.jghao and shtti.bhao=cjia.bhao
	and mcheng='篮球'
	and cjia.jghao in (select cjia.jghao
		from shtti, cjia
		where cjia.bhao=shtti.bhao and mcheng='足球' )
go