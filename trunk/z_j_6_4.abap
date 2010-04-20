* 范围筛选
report z_j_6_4.
data data1(20) type c.

select-options d1 for data1.
loop at d1.
    write: / 'sign:', d1-sign, " I:option不取反 或 E: 取反(加NOT) 
             'option:', d1-option, " 包含选择运算符 
             'low:', d1-low,
             'high:', d1-high.
endloop.
