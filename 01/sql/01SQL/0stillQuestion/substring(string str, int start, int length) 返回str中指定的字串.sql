-- E:\liaocaiyuan\Documents\01SQL\5T-SQL����\ϵͳ���ú���

-- substring(string str, int start, int length) ����str��ָ�����ִ�.
use xsbook
select substring(����,1,1) as ��, substring(����,2,len(����)-1)as ���� 
	from xs
	order by ���� -- order by ��ʲô��˼????????????