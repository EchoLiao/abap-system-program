USE XSBOOK
EXEC sp_addtype birthday_date,'datetime', 'NULL' /* ��������������birthday_date */
go 
create default birthday as '1970,00,00' /* ����Ĭ��ֵ���� */
go
exec sp_bindefault 'birthday','birthday_date' 