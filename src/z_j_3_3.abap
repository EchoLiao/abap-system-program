* 带表头行的表

report  Z_J_3_3.

data:   begin of man,
            name(20) type c,
            high type p DECIMALS 4, " 4: 小数位位数
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
" move man2[] to man1. " 不能用于有header的, man2无工作空间

loop at man2 into man.
  write: / man-name, man-high, man-weight. " 无表头行: 不可以用man2访问表字段
endloop.

loop at man1.
  write: / man1-name, man1-high, man1-weight.
endloop.
