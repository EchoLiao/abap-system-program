/* ������ͼf_xs, ȫΪŮ�� */
create view f_xs
as
select *
from xs
where �Ա�=1
with check option
/*
select  * --����֤��,����,������
from f_xs
where רҵ��='�����'
*/