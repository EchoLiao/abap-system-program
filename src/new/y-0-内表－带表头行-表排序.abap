* ����ͷ�еı�

report  z_j_3_3.

data:   begin of man,
            name(20) type c,
            high type p decimals 4, " 4: С��λλ��
            weight type p decimals 2,
        end of man.
data:   man1 like table of man with header line,
        man2 like standard table of man,
        man3 like hashed table of man with unique key name.

man-name = 'liao'.
man-high = '1.68'.
man-weight = 120.
append man to man1.

man-name = 'huang'.
man-high = '1.68'.
man-weight = 100.
" append man to man1.
insert man into table man1. " ����û�йؼ���: table

man-name = 'cai'.
man-high = '1.78'.
man-weight = 160.
" append man to man1.
insert man into table man1. " ����û�йؼ���: table

move man1[] to man2.
move man1[] to man3.
" move man2[] to man1. " ����������header��, man2�޹����ռ�

loop at man2 into man.
  write: / man-name, man-high, man-weight. " �ޱ�ͷ��: ��������man2���ʱ��ֶ�
endloop.

skip. " �������
skip. " �������
uline. " �»���

" ��û�� by ����ģ�����ݹؼ�������.
sort man1 descending by weight ascending. " ascending ����
loop at man1.
  write: / man1-name, man1-high, man1-weight.
endloop.


uline. " �»���
loop at man3 into man.
  write: / man-name, man-high, man-weight. " �ޱ�ͷ��: ��������man2���ʱ��ֶ�
endloop.
