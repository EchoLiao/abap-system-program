* ����ͷ�еı�

report  Z_J_3_3.

data:   begin of man,
            name(20) type c,
            high type p DECIMALS 4, " 4: С��λλ��
            weight type p decimals 2,
        end of man.
data:   man1 like table of man with header line,
        man2 like table of man.

man-name = 'LIAO'.
man-high = '1.68'.
man-weight = 120.
append man to man1.

man-name = 'CAI'.
man-high = '1.78'.
man-weight = 160.
append man to man1.

move man1[] to man2.
" move man2[] to man1. " ����������header��, man2�޹����ռ�

loop at man2 into man.
  write: / man-name, man-high, man-weight. " �ޱ�ͷ��: ��������man2���ʱ��ֶ�
endloop.

loop at man1.
  write: / man1-name, man1-high, man1-weight.
endloop.
