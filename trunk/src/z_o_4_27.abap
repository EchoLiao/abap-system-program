report z_o_4_27.

data:   f1 type i, f2 type i.
field-groups header.
insert f1 f2 into header.

do 10 times.
    f1 = sy-index.
    f2 = sy-index ** 2.
    extract header. " ¥Ê»Îheader
enddo.

sort descending. " Ωµ–Ú≈≈–Ú
loop.
    write: / f1, f2.
endloop.
