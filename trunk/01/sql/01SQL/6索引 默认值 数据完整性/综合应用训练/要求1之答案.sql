use xsbook
/*
if exists(select name from sysobjects where name='view2' and type='v')
 	drop view view2
*/

/*if exists(select name from sysobjects where name='historytable' and type='u')
	drop table historytable
go */ /*
create table historytable
(	����� char(16) not null,
	����֤�� char(8) not null,
	����ʱ�� datetime not null,
	isbn char(16) not null
)
go*/

alter table historytable
	add constraint ht_pk
	primary key clustered(�����,����֤��, ����ʱ��)  -- ��������Լ��
go
