report z_o_4_19.
data: string(30) type c value 'this is a testing sentence.'.
write: / 'searched', 'sy-subrc', 'sy-fdpos'.

search string for 'x'. " ��string�в����ִ�: x, ����β���ո�
write: / 'x ', " under 'sy-subrc': ��sy-subrc ���·����. 
    sy-subrc under 'sy-subrc', " �ҵ�, sy-subrc����0; ��֮, ����4. 
    sy-fdpos under 'sy-fdpos'. 

search string for '.e .'. " ��string�в����ִ�: e, ������β���ո�  
write: / '.e .',
    sy-subrc under 'sy-subrc',
    sy-fdpos under 'sy-fdpos'. 

search string for 'e '.
write: / 'e ',
    sy-subrc under 'sy-subrc',
    sy-fdpos under 'sy-fdpos'.  " ���ص�һ�����ֵ� 

search string for '*e'. " ������e��β�ĵ���! 
write: / '*e',
    sy-subrc under 'sy-subrc',
    sy-fdpos under 'sy-fdpos'.  " ���ص�һ�����ֵ� 

search string for 'i*'. " ������i��ʼ�ĵ���! 
write: / 'i*',
    sy-subrc under 'sy-subrc',
    sy-fdpos under 'sy-fdpos'.  " ���ص�һ�����ֵ� 

while sy-subrc = 0. " �滻. 
    replace 'e' with '-' into string.
endwhile.
write: / string.

data:   len type i.
len = strlen( string ). " len = strlen(string). ���� !!!!!
write: / 'lenght of', string, 'is', len.

data: f1(8) value 'abcdefgh',
      f2(20) value '12345678901234567890'.
f2+6(5) = f1+3(3).
write: / f2. " f2��Ϊ: 123456def  234567890 
