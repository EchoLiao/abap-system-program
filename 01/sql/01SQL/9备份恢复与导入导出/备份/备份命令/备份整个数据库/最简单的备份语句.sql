

use master
exec sp_addumpdevice 'disk', 'test1', 'f:\temp\test1.bak' /* 创建备份设置 */
go
backup database xsbook to test1 /* 备份数据库xsbook */
go