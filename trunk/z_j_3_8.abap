* ��ʽ�����
* ?????
report  ytest001.
data:    wa like spfli.
write: /.
write: 10'���������',40'��������',60'���Ҵ���',80'��ɳ���',100'��ɻ���'.

select * into wa from spfli.
  write: / wa-carrid under '���������',
           wa-connid under '��������',
           wa-countryfr under '���Ҵ���',
           wa-cityfrom under '��ɳ���',
           wa-airpfrom under '��ɻ���'.
endselect.
