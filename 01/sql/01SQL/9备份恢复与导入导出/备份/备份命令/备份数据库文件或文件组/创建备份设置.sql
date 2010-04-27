/* 
   -- 在本地硬盘上创建一个命名备份设置 
use master
exec sp_addumpdevice 'disk',   --指出介质类型   可以是{disk | tape | pipe}  
	'mybackupfile',   -- 逻辑名 
	'f:\sql_backup\mybackupfile.bak' -- 物理名
go */

use master
exec sp_addumpdevice 'disk', 'dbase1backup','f:\sql_backup\dbase1backup.bak'
go
exec sp_addumpdevice 'disk', 'dbasebackuplog', 'f:\sql_backup\dbasebackuplog.bak' 
go