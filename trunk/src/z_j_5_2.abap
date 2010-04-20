*更改前景背景颜色

report z_j_5_2.
" 【5.2】
*更改背景颜色
format color col_total.
write 'hello world'. 
write 'welcome!'.
*更改前景颜色
format color col_group intensified on inverse on.
write / 'hello world'.
write 'welcome'.
