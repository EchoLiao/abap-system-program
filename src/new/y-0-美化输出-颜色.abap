" format color <n> [on] intensified [on|off] inverse [on|off]
" color	����:
" col_background    ȡ����gui
" col_heading       ����
" col_normal        ����
" col_total         ��
" col_key           ����
" col_positive      ��
" col_negative      ��
" col_group         ��
" intensified       ������������ɫ������
" inverse           �������Ƿ�Ӱ��ǰ����ɫ

" ��5.1��
report  z_j_5_1.
*���ݿ��spfli���
tables ytcity.
skip.

format color col_heading.
*�����ͷ
" sy-vline " �����ֱ��
uline at /(65).
write: / sy-vline, (15) 'id', sy-vline, (15) 'name', sy-vline, (25)
    'country', sy-vline.
uline at /(65).
format color off.

new-page line-count 8. " ��ҳ

*�������
select * from ytcity.
    if ytcity-yct_id = '100'.  " = ����Ҫ�пո� !!!!!
        format color col_key.
    else.
        format color off.
    endif.
    write: / sy-vline, (15) ytcity-yct_id, sy-vline, (15) ytcity-yct_name,
        sy-vline, (25) ytcity-yct_country, sy-vline.
    uline at /(65).
endselect.
