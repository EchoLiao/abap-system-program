
/* ��ѯѡ����2�����Ͽγ̵�ѧ��ѧ�� */
use st
select sno, count(cno)
from sc
group by sno
having count(cno)>=2
