USE XSBOOK
CREATE TABLE XS4
(	����֤�� char(8) NOT NULl,
	���� char(8) NOT NULL,
	רҵ�� char(12) NOT NULL,
	�Ա� bit NOT NULL,
	�������� smalldatetime NOT NULL,
	������ tinyint NOT NULL CONSTRAINT def_val DEFAULT 0, /* ����Ĭ��ֵ, ��ָ��Լ����:def_val */
	��Ƭ image NULL
)
go