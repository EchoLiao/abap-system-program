
use xsbook /*  ��selectȨ������accounting��ɫ, ������������Ȩ�������Ķ���(��with grant option ָ��) */
grant select on xs to accounting with grant option 
go

/* accounting��ɫ���û���selectȨ�����費��accounting��ɫ���û�dongdong */
grant select on xs to dongdong as accounting 
go