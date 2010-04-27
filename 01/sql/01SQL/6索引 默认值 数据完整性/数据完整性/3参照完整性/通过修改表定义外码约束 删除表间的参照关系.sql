use xsbook

if exists(select name from sysobjects where name='jy_foreign' and type='f')
	begin
		alter table jy  /* 必须要加这一条语句!!! */
			drop CONSTRAINT jy_foreign
	end

go
alter table jy
	add constraint jy_foreign
		foreign key (借书证号)
		references xs(借书证号)
go