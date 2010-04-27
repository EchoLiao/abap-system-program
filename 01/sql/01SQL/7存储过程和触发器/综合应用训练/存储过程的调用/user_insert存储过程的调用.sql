-- E:\liaocaiyuan\Documents\01SQL\存储过程和触发器\综合应用训练\存储过程的调用
use xsbook
declare @name1 char(8), @name2 char(8)
set @name1='liao'
set @name2='liaocai'

exec user_insert @name1, @name2,  'liao' ,  2   --为什么不起作用???????????
go