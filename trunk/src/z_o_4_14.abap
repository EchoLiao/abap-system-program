report z_o_4_14.
* ===================================================
data:   outi type i,
        ini  type i.
do 2 times.
    outi = sy-index.
    write: / sy-index.
    skip. " 等价于: write: / . 
    do 3 times.
        ini = sy-index.
        write:  outi no-gap, '-' no-gap, ini left-justified. " 要有":" 
    enddo.
    skip.
enddo.

* ===================================================
data:   len type i,
        string(30) type c value 'beijing    2008'.
while string ne space. " 当...不等于未尾时. 
    len = sy-index. " sy-index 从1记起. 
    shift string.
endwhile.
" len = sy-index. " 此时sy-index为0.
write: / 'len:', len.

* ===================================================
data:   s1(19) type c value 'first new old',
        s2(19) type c value 'second',
        s3(22) type c,
        sep(1) type c value '.'.
concatenate s1 s2 into s3.
write: / s3.
concatenate s1 s2 into s3 separated by sep. " 连接字符串 
write: / s3.

data: itab type table of string.
split s1 at 's' into table itab. " 拆分存入表. 
loop at itab into s1.
    write: / s1.
endloop.
