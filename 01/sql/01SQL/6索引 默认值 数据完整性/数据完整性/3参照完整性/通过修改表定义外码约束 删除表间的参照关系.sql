use xsbook

if exists(select name from sysobjects where name='jy_foreign' and type='f')
	begin
		alter table jy  /* ����Ҫ����һ�����!!! */
			drop CONSTRAINT jy_foreign
	end

go
alter table jy
	add constraint jy_foreign
		foreign key (����֤��)
		references xs(����֤��)
go