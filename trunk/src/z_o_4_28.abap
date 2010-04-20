report z_o_4_28.
data:   begin of address,
            street(20) type c value 'nam street',
            no(24)      type c value 'address-city', " ע��ֵ! 
            zip(5)     type c value '56789',
            city(20)   type c value 'sinll',
        end of address.
field-symbols:  <street_no> type c,
                <zip_city> type c.
assign: address(24) to <street_no>, " ��̬�����ֶη���
        address+24(5) to <zip_city>.
write: / <street_no>, <zip_city>.

data:   str(20) type c value 'output string',
        name(20) type c value 'str'. " ֵΪ�ֶ�str 
" assign (name) to <street_no>. " ��̬�����ֶη��� 
assign (address-no) to <street_no>. " ��̬�����ֶη��� 
write: / <street_no>.

types:  begin of t_date,
            year(4) type n,
            month(2) type n,
            day(2) type n,
        end of t_date.
field-symbols <fs> type t_date.
assign: sy-datum to <fs> casting. " ǿ��ת�� 
write: / <fs>-year, <fs>-month, <fs>-day.
