
/* �ҳ�ÿ��ѧ��������ƽ���ɼ��Ŀγ̺� */

use st
select sno, cno �γ̺�
from sc x
where Grade>  -- ���뱣֤�Ӳ�ѯ���ص�ֻ��һ����¼, �����������ñȽϷ� 
	(select avg(Grade)  
	from sc y
	where y.sno=x.sno
	--group by sno
	)
go
