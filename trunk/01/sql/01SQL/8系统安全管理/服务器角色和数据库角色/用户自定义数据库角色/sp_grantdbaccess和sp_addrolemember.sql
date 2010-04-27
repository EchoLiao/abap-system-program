
use xsbook
go -- sp_grantdbaccess sp_addrolemember
exec sp_grantdbaccess 'liao-pc\liao2', 'dong' /* 为数据库添加用户, dong为数据库名 */
go
exec sp_addrolemember 'role', 'dong' /* 将dong添加到角色role中 */
go