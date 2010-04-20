" format color <n> [on] intensified [on|off] inverse [on|off]
" color	参数:
" col_background    取决于gui
" col_heading       灰蓝
" col_normal        淡灰
" col_total         黄
" col_key           黄绿
" col_positive      绿
" col_negative      红
" col_group         紫
" intensified       参数：背景颜色参数。
" inverse           参数：是否影响前景颜色

" 【5.1】
report  z_j_5_1.
*数据库表spfli相关
tables ytcity.
skip.

format color col_heading.
*输出表头
" sy-vline " 输出坚直线
uline at /(65).
write: / sy-vline, (15) 'id', sy-vline, (15) 'name', sy-vline, (25)
    'country', sy-vline.
uline at /(65).
format color off.

new-page line-count 8. " 换页

*输出内容
select * from ytcity.
    if ytcity-yct_id = '100'.  " = 两边要有空格 !!!!!
        format color col_key.
    else.
        format color off.
    endif.
    write: / sy-vline, (15) ytcity-yct_id, sy-vline, (15) ytcity-yct_name,
        sy-vline, (25) ytcity-yct_country, sy-vline.
    uline at /(65).
endselect.
