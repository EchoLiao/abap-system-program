use xsbook 
alter table xs5
	add 身份证 char(20) NULL
go 
alter table xs
	add constraint xs_shenfen
	unique nonclustered(身份证)
go