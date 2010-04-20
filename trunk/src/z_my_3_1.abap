report  z_3_1.
data: begin of man,
          name(30) type c,
          high type p decimals 2,
          weight type p decimals 2,
      end of man.

field-symbols <fsa> like man.
data man1 like man.

man1-name = 'liao'.
man1-high = '1.78'.
man1-weight = 140.

assign man1 to <fsa>.
write: / <fsa>-name,
    <fsa>-high,
    <fsa>-weight.

data: hex, hex2 type x.
hex = 'fbd5'.
hex2 = 'f'.
write: / hex, hex2. " 为一个内存值 ?????

types: spfli_type type spfli,
    surname(20) type c,
    begin of address,
        name        type surname,
        street(30)  type c,
        city        type spfli_type-cityfrom,
    end of address.
data: my_add type address.
my_add-name = 'zhang ming'.
my_add-street = 'no. 10 ave'.
my_add-city = 'shanghai'.
write: / my_add.
