use xsbook
create table xs5
(
	����֤�� library_card_num  /* �˴�������',' */-- library_card_num Ϊ�Զ������������ 
		constraint xs_pk primary key,
	���� char(8) NOT NULL,
	רҵ�� char(12) NULL,
	�Ա� bit NOT NULL,
	����ʱ�� datetime NOT NULL,
	�绰 telphone /* */
		constraint tel_uk unique, /* UNIQUE Լ�� */
	������ tinyint  check(������>=0 and ������<=20) NULL,
	��Ƭ image NULL  
) 