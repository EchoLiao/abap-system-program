
/* ������˵�ƽ���ɼ� */
use st
select sno, avg(grade)
from sc
group by sno
go