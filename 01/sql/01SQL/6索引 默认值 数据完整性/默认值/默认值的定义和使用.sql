USE XSBOOK
go
/* 定义语句必须为第一条语句或紧跟在go之后 */
CREATE DEFAULT jss_default AS 0 /* 默认值定义 */
go
EXEC sp_bindefault 'jss_default', 'xs.借书数'  /* 默认值使用 */
go