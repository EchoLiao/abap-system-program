
-- E:\liaocaiyuan\Documents\01SQL\9备份恢复与导入导出\备份\创建备份设备\临时设置
use master
go /* 在磁盘上创建一个临时备份设置, 它用来备份数据库xsbook */
backup database   xsbook to 'F:\temp\tempxsbook.bak' 
go /* 怎么会有错的????? */