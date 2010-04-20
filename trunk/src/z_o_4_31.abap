report z_o_4_31. " ?????
types:  begin of t_struct,
            col1 type i,
            col2 type i,
        end of t_struct.
data:   dref1 type ref to data,
        dref2 type ref to data.
field-symbols:  <fs1> type t_struct,
                <fs2> type i.
create data dref1 type t_struct.
assign dref1->* to <fs1>.
" write: / <fs2>.
<fs1>-col1 = 1.
<fs1>-col2 = 2.
dref2 = dref1. " 可以赋值
assign dref2->* to <fs2> casting.
write: / <fs2>.
get reference of <fs1>-col2 into dref2.
assign dref2->* to <fs2>.
write: / <fs2>.

write: / <fs1>.
write: / <fs2>.
