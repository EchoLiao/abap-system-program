/* �������� */
/* check()Լ�� */
USE XSBOOK2
CREATE TABLE BOOK
( 	ISBN CHAR(16) NOT NULL,
	���� char(26) NOT NULL,
	���� char(8) NOT NULL,
	������  char(20) NOT NULL,
	�۸� float Not null check(�۸�<=200), /* ��������, ��check()ʵ�� */
	������ smallint NOT null,
	����� smallint not null 
)
go