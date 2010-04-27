
/* 在磁带上创建一个命名备份设置 */
use master
exec sp_addumpdevice 'tape',
	'tapebackupfile', 	
	'\\.\tape0'
go