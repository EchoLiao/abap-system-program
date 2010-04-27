use xsbook
/*
if exists(select name from sysobjects where name='view2' and type='v')
 	drop view view2
*/

/*if exists(select name from sysobjects where name='historytable' and type='u')
	drop table historytable
go */ /*
create table historytable
(	索书号 char(16) not null,
	借书证号 char(8) not null,
	借书时间 datetime not null,
	isbn char(16) not null
)
go*/

alter table historytable
	add constraint ht_pk
	primary key clustered(索书号,借书证号, 借书时间)  -- 建立主键约束
go
