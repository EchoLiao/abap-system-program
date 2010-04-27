use xsbook
if exists(select name from sysobjects where name='ht_foreign' and type='f')
	alter table historytable
		drop constraint ht_foreign
go
alter table historytable
	add constraint ht_foreign 
	foreign key (借书证号)
	references xs(借书证号)
		on delete cascade on update cascade
go