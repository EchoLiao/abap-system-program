*  4.7.3 �����Ӻ�������
* �������������������ݱ�ֱ�Ӷ�ȡ����ʱ����Ҫʹ�õ��ڱ����Ӻ���������䡣
* ���� 4.3��

report  z_j_4_3.
*����ṹ
data:begin of arcd,
          city_id      type ytcity-yct_id,
          city_name    type ytcity-yct_name,
          school_id    type ytschool-ysh_id,
          school_name  type ytschool-ysh_name,
          student_name type ytstudent-ystu_name,
     end of arcd.

*������
data arcd1 like arcd.

write: / 'aarcd1-city_id', 'aarcd1-city_name', 'aarcd1-school_id',
    'aarcd1-school_name', 'aarcd1-student_name'.
*�������ݱ�,��ȡǰ10����¼,д�빤����,�����
select ytcity~yct_id ytcity~yct_name ytschool~ysh_id ytschool~ysh_name ytstudent~ystu_name
    into arcd1 from ytcity
        inner join ytschool on ytcity~yct_id = ytschool~yct_id
        inner join ytstudent on ytschool~ysh_id = ytstudent~ysh_id
        up to 100 rows. " Ψһһ�� "."
    write: / arcd1-city_id, arcd1-city_name, arcd1-school_id,
            arcd1-school_name, arcd1-student_name.
endselect.

" select spfli~carrid spfli~connid sflight~fldate into arcd1 from spfli
    " inner join sflight on spfli~carrid = sflight~carrid
          " and spfli~connid = sflight~connid up to 10 rows.
  " write: / arcd1-carrid,arcd1-connid,arcd1-fldate.
" endselect.
