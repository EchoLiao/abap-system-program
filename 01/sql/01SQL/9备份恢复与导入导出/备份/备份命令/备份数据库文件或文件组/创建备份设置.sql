/* 
   -- �ڱ���Ӳ���ϴ���һ�������������� 
use master
exec sp_addumpdevice 'disk',   --ָ����������   ������{disk | tape | pipe}  
	'mybackupfile',   -- �߼��� 
	'f:\sql_backup\mybackupfile.bak' -- ������
go */

use master
exec sp_addumpdevice 'disk', 'dbase1backup','f:\sql_backup\dbase1backup.bak'
go
exec sp_addumpdevice 'disk', 'dbasebackuplog', 'f:\sql_backup\dbasebackuplog.bak' 
go