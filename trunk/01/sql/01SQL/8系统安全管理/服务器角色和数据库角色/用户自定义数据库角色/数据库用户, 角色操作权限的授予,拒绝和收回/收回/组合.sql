
/* �û�zhang */
/*  �û�zhangӵ�жԱ�xs�Ĳ���Ȩ�� */
grant select on xs to role with grant option

/* �û�li */
/* �û�li��role��ɫ�ĳ�Ա,  �û�huang����role��ɫ�ĳ�Ա */
grant select on xs to huang as role

/* �û�li */
revoke select on xs to huang as role
/* �û�li�ǽ�ɫ�ĳ�Ա, ͨ���û�liִ��Ȩ��ʱ, ������asָ���������Ľ�ɫ */
go