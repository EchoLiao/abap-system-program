* ��Χɸѡ
report z_j_6_4.
data data1(20) type c.

select-options d1 for data1.
loop at d1.
    write: / 'sign:', d1-sign, " I:option��ȡ�� �� E: ȡ��(��NOT) 
             'option:', d1-option, " ����ѡ������� 
             'low:', d1-low,
             'high:', d1-high.
endloop.
