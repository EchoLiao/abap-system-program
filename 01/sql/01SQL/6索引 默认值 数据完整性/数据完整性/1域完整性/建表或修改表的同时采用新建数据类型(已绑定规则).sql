use xsbook
exec sp_addtype 'telphone', 'char(12)','null'  /* 新建数据类型 */
go
if exists(select name from sysobjects where name='tel_rule' and type='r')
	drop rule tel_rule
go
create rule tel_rule
	as @tel like '[1-9][1-9][1-9][1-9][1-9][1-9][1-9][1-9][1-9]'  /* 新规则对象 */
go
exec sp_bindrule 'tel_rule', 'telphone' /* 给指定类型绑定指定规则 */
go
/*
create table xs
(
	借书证号 library_card_num,  -- library_card_num 为自定义的数据类型 
	姓名 char(8) NOT NULL,
	专业名 char(12) NULL,
	性别 bit NOT NULL,
	出生时间 datetime NOT NULL,
	电话 telphone,
	借书数 tinyint  check(借书数>=0 and 借书数<=20) NULL,
	照片 image NULL  
) */
alter table xs
	add 电话 telphone
go



