
use jigongshetuan
go
if exists(select name from sysobjects where name='stfzren' and type='v')
	drop view stfzren
go
create view stfzren(bhao, mcheng, fzrzghao, fzrxming, fzrxbie)
	as
	select bhao,mcheng,fzren,xming,xbie
	from jgong, shtti
	where jgong.jghao=shtti.fzren
go

if exists(select name from sysobjects where name='cjrqkuang' and type='v')
	drop view cjrqkuang 
go
create view cjrqkuang(jghao,xming,stbhao,stmcheng,cjrqi)
	as	
	select cjia.jghao,xming,cjia.bhao,mcheng,cjrqi
	from jgong,shtti,cjia
	where jgong.jghao=cjia.jghao and shtti.bhao=cjia.bhao
go
