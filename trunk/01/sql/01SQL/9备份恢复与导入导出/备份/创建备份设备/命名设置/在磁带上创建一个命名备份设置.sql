
/* �ڴŴ��ϴ���һ�������������� */
use master
exec sp_addumpdevice 'tape',
	'tapebackupfile', 	
	'\\.\tape0'
go