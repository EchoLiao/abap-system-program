report z_j_8_1.
" 8.1	�򵥵� alv �ؼ�ʵ��
" �Ժ����spfli��Ϊ����ʹ�������ֵ䶨��ṹ��ͨ�� alv �ؼ���ʾ���ݡ�
*�����ڱ�
data wa_spfli like table of yzhhz with header line.
*�ڱ�ֵ
select * into table wa_spfli from yzhhz. 
*ͨ�������ֵ�ṹ��ʾalv
call function 'REUSE_ALV_LIST_DISPLAY'
  exporting
    i_structure_name = 'yzhhz' 
  tables
    t_outtab         = wa_spfli
  exceptions
    program_error    = 1
    others           = 2.
if sy-subrc <> 0.
* message id sy-msgid type sy-msgty number sy-msgno
*         with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
endif.

