
/* �ڱ���Ӳ���ϴ���һ�������������� */
use master
exec sp_addumpdevice 'disk',  /* ָ����������   ������{disk | tape | pipe} */
	'mybackupfile',  /* �߼��� */
	'f:\sql_backup\mybackupfile.bak' /* ������ */
go