
use xsbook /* 将一个登录账号添加为某个数据库的用户, 并取名为dongdong */
exec sp_grantdbaccess 'lihong' , 'dongdong'
go