* ʹ�����������ڱ���

report  ytest001.

data:   begin of man,
            name(20) type c,
            high type p decimals 2,
            weight type p decimals 2,
        end of man.
data: man1 like table of man.

man-name = 'zhang'.
man-high = '1.68'.
man-weight = 120.
insert man into table man1.
man-name = 'liu'.
man-high = '1.78'.
man-weight = 160.
insert man into table man1.

loop at man1 into man.
    write: / man-name,man-high, man-weight.
endloop.

man-name = 'li'.
man-high = '1.58'.
man-weight = 110.
insert man into man1 index 2. " �ڵ�2�в���, ԭ��2���Ժ��������������

man-name = 'li'.
man-high = '1.58'.
man-weight = 110.
insert man into man1 index 2. " �ڵ�2�в���, ԭ��2���Ժ��������������

uline.

loop at man1 into man.
    write: / man-name,man-high,man-weight.
endloop.
