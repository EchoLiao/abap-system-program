
declare @str1 char(22), @str2 char(22), @str3 char(22)
set @str1='liaocaiyuan'
set @str2='cai'
set @str3='google'
select replace(@str1, @str2, @str3) /* ���ַ���str1�е��Ӵ�str2����str3 */