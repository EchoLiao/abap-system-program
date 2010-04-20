* 修改内表数据
report Z_J_3_5.
data:   begin of man,
            name(20) type c,
            high type p decimals 2,
            weight type p decimals 2,
        end of man.
data:   man1 like hashed table of man with unique key name.
man-name = '张参'.
man-high = '1.68'.
man-weight = 120.
insert man into table man1.

man-name = '刘志'.
man-high = '1.78'.
man-weight = 160.
insert man into table man1.

loop at man1 into man.
    write: / man-name,man-high, man-weight.
endloop.

man-name = '张参'.
man-high = '2.22'.
man-weight = 220.
modify table man1 from man. " " 

loop at man1 into man.
  write: / man-name,man-high,man-weight.
endloop.
