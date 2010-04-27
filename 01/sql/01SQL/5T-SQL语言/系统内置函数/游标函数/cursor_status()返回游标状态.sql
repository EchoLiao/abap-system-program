
/*
cursor_status(
	{'local', 'cursor_name'} -- 指明数据源为本地游标
	| {'global', 'cursor_name'} -- 指明数据源为全局游标
	| {'variable', cursor_variable} -- 指明数据源为游标变量(smallint类型的)
	)
返回值:
1	游标的结果集最少有一行
0	游标的结果集为空
-1	游标被关闭
-2	游标不可用
-3	游标不存在
*/