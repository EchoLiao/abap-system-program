report z_o_4_12.

if sy-uzeit < '120000'. " sy-uzeit ��ʾ��ǰʱ�� 
    write: / 'mornig'.
elseif sy-uzeit > '200000'.
    write: / 'nigh'.
endif.

case sy-datum+4(2). " ���� 
    when '12' or '01' or '02'.
        write: / 'wirnter'.
    when others.
        write: / 'illegal'.
endcase.


