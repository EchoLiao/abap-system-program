
use master
exec sp_dropdevice 'mybackupfile', delfile /* 如果命名备份设置是磁盘文件, 则必须指定delfile选项 */
go