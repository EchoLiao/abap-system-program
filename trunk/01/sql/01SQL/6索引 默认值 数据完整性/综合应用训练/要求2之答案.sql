use xsbook
if exists(select name from sysobjects where name='ht_foreign' and type='f')
	alter table historytable
		drop constraint ht_foreign
go
alter table historytable
	add constraint ht_foreign 
	foreign key (����֤��)
	references xs(����֤��)
		on delete cascade on update cascade
go