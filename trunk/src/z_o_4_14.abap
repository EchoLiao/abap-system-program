report z_o_4_14.
* ===================================================
data:   outi type i,
        ini  type i.
do 2 times.
    outi = sy-index.
    write: / sy-index.
    skip. " �ȼ���: write: / . 
    do 3 times.
        ini = sy-index.
        write:  outi no-gap, '-' no-gap, ini left-justified. " Ҫ��":" 
    enddo.
    skip.
enddo.

* ===================================================
data:   len type i,
        string(30) type c value 'beijing    2008'.
while string ne space. " ��...������δβʱ. 
    len = sy-index. " sy-index ��1����. 
    shift string.
endwhile.
" len = sy-index. " ��ʱsy-indexΪ0.
write: / 'len:', len.

* ===================================================
data:   s1(19) type c value 'first new old',
        s2(19) type c value 'second',
        s3(22) type c,
        sep(1) type c value '.'.
concatenate s1 s2 into s3.
write: / s3.
concatenate s1 s2 into s3 separated by sep. " �����ַ��� 
write: / s3.

data: itab type table of string.
split s1 at 's' into table itab. " ��ִ����. 
loop at itab into s1.
    write: / s1.
endloop.
