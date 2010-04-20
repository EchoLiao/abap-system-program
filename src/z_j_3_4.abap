* 表排序
report  ytest001.

data:   begin of man,
            name(20) type c,
            high type p decimals 2,
            weight type p decimals 2,
        end of man.
data:   man1 like HASHED table of man with unique key name.

man-name = 'wang'.
man-high = '1.68'.
man-weight = 120.
insert man into table man1.

man-name = 'li'.
man-high = '1.78'.
man-weight = 160.
insert man into table man1.

man-name = 'zhu'.
man-high = '1.72'.
man-weight = 130.
insert man into table man1.

loop at man1 into man.
  write: / man-name, man-high, man-weight.
endloop.

sort man1 descending by weight ascending. " ascending 升序
skip.

uline. " 下划线

loop at man1 into man.
  write: / man-name, man-high, man-weight.
endloop.
