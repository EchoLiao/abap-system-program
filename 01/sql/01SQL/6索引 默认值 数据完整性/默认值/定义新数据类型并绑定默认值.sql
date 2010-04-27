USE XSBOOK
EXEC sp_addtype birthday_date,'datetime', 'NULL' /* 定义新数据类型birthday_date */
go 
create default birthday as '1970,00,00' /* 定义默认值对象 */
go
exec sp_bindefault 'birthday','birthday_date' 