use xsbook
alter table xs
	add constraint card_constraint check(����֤�� like    /* ����Լ��, card_constraint��Լ���� */
	'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' and ����֤�� <> '00000000')
go