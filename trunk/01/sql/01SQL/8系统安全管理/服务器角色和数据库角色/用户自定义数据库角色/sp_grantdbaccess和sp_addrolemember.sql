
use xsbook
go -- sp_grantdbaccess sp_addrolemember
exec sp_grantdbaccess 'liao-pc\liao2', 'dong' /* Ϊ���ݿ�����û�, dongΪ���ݿ��� */
go
exec sp_addrolemember 'role', 'dong' /* ��dong��ӵ���ɫrole�� */
go