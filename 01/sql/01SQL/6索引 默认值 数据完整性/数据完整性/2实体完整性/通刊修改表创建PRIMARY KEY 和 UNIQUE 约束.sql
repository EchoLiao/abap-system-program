use xsbook 
alter table xs5
	add ���֤ char(20) NULL
go 
alter table xs
	add constraint xs_shenfen
	unique nonclustered(���֤)
go