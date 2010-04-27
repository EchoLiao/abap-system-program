use xsbook
exec sp_addtype 'telphone', 'char(12)','null'  /* �½��������� */
go
if exists(select name from sysobjects where name='tel_rule' and type='r')
	drop rule tel_rule
go
create rule tel_rule
	as @tel like '[1-9][1-9][1-9][1-9][1-9][1-9][1-9][1-9][1-9]'  /* �¹������ */
go
exec sp_bindrule 'tel_rule', 'telphone' /* ��ָ�����Ͱ�ָ������ */
go
/*
create table xs
(
	����֤�� library_card_num,  -- library_card_num Ϊ�Զ������������ 
	���� char(8) NOT NULL,
	רҵ�� char(12) NULL,
	�Ա� bit NOT NULL,
	����ʱ�� datetime NOT NULL,
	�绰 telphone,
	������ tinyint  check(������>=0 and ������<=20) NULL,
	��Ƭ image NULL  
) */
alter table xs
	add �绰 telphone
go



