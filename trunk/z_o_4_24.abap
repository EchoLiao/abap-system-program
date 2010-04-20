report z_o_4_24.
data:   begin of line, 
            num type i,
            sqr type i,
        end of line,
        itab type standard table of line with key table_line.
        " table_line ?????

do 5 times.
    line-num = sy-index.
    line-sqr = sy-index ** 2.
    append line to itab.
enddo.
loop at itab into line.
    write: / line-num, line-sqr.
endloop.
clear itab.
