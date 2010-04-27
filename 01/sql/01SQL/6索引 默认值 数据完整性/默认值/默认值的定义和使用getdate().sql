USE XSBOOK
go
/* 定义语句必须为第一条语句或紧跟在go之后 */
CREATE DEFAULT startbord AS getdate() /* 默认值定义 */
go
EXEC sp_bindefault 'startbord', 'xs4.[出生日期]'  /* 默认值使用 */
go