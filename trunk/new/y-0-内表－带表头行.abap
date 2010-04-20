* 带表头行的表

report  z_j_3_3.

data:   begin of man,
            name(20) type c,
            high type p decimals 4, " 4: 小数位位数
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
insert man into table man1. " 不能没有关键字: table

man-name = 'cai'.
man-high = '1.78'.
man-weight = 160.
" append man to man1.
insert man into table man1. " 不能没有关键字: table

move man1[] to man2.
move man1[] to man3.
" move man2[] to man1. " 不能用于有header的, man2无工作空间

loop at man2 into man.
  write: / man-name, man-high, man-weight. " 无表头行: 不可以用man2访问表字段
endloop.

skip. " 输出空行
skip. " 输出空行
uline. " 下划线

" 若没有 by 后面的，则根据关键字排序.
sort man1 descending by weight ascending. " ascending 升序
loop at man1.
  write: / man1-name, man1-high, man1-weight.
endloop.


uline. " 下划线
loop at man3 into man.
  write: / man-name, man-high, man-weight. " 无表头行: 不可以用man2访问表字段
endloop.
