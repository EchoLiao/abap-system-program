* �޸��ڱ�����
* ʹ�����������ڱ���
report  ytest001.

data:   begin of man, 
            name(20) type c, 
            high type p decimals 2, 
            weight type p decimals 2, 
        end of man.
" data: man1 like hashed table of man with unique key name.
data: man1 like table of man.

man-name = 'ZHANG'. 
man-high = '1.68'.
man-weight = 120. 
insert man into table man1.

man-name = 'LIU'. 
man-high = '1.78'.
man-weight = 160. 
" insert man into table man1.
insert man into man1 index 2. " �ڵ�2�в���, ԭ��2���Ժ��������������, (��������hashed��)

loop at man1 into man.
  write: / man-name,man-high, man-weight.
endloop.

delete man1 where name = 'ZHANG'. 
skip. " ????? 
uline.
loop at man1 into man.
  write: / man-name,man-high,man-weight.
endloop.
