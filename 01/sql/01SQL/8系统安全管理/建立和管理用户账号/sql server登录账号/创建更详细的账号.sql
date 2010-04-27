
-- E:\liaocaiyuan\Documents\01SQL\8系统安全管理\sql server登录账号
/* 默认语言为us_english, SID号为; 0x1234567812345678 */
exec sp_addlogin 'chen2' , 'baidu', 'xsbook', 'us_english' ,0x1234567812345678
go           /* 为什么不成功??????????????? */