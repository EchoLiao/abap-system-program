-- E:\liaocaiyuan\Documents\01SQL\9备份恢复与导入导出\备份\备份命令\备份数据库文件或文件组

backup database dbase
	file=dbase1 to dbasebackup /* 备份数据库中的数据文件dbase1 */

go
backup log database to dbasebackuplog /* 备份事务日志文件 */
go
