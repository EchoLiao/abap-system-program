-- E:\liaocaiyuan\Documents\01SQL\�洢���̺ʹ�����\�ۺ�Ӧ��ѵ��\�洢���̵ĵ���
use xsbook
declare @name1 char(8), @name2 char(8)
set @name1='liao'
set @name2='liaocai'

exec user_insert @name1, @name2,  'liao' ,  2   --Ϊʲô��������???????????
go