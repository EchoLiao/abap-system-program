
/*  执行事务日志恢复必须在进行完全数据库恢复以后 */

restore database xsbook2 /* 先完全恢复数据库 */
	from test1 
	with norecovery

restore log xsbook2 /* 然后再恢复事务日志 */
	from xslogbk
