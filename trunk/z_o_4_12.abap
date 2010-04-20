report z_o_4_12.

if sy-uzeit < '120000'. " sy-uzeit 表示当前时间 
    write: / 'mornig'.
elseif sy-uzeit > '200000'.
    write: / 'nigh'.
endif.

case sy-datum+4(2). " 季节 
    when '12' or '01' or '02'.
        write: / 'wirnter'.
    when others.
        write: / 'illegal'.
endcase.


