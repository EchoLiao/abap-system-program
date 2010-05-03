report z_j_8_2.
" 8.2	自定义输出字段的 alv 控件实例
*alv使用到的类库
type-pools: slis.
*一列描述
data wa_alv_field type slis_fieldcat_alv.
*列描述内表，列清单 
data wa_alv_fieldcat type slis_t_fieldcat_alv.
*定义内表
data wa_spfli like table of yzhhz with header line.
*内表赋值
select * into table wa_spfli from yzhhz. 

*定义第1到第3个字段
wa_alv_field-col_pos = 1. " 第几列? 
wa_alv_field-fieldname = 'id'.
wa_alv_field-seltext_m = 'id-number'.
append wa_alv_field to wa_alv_fieldcat.

wa_alv_field-col_pos = 2.
wa_alv_field-fieldname = 'cha'.
wa_alv_field-seltext_m = 'name'.
append wa_alv_field to wa_alv_fieldcat.

wa_alv_field-col_pos = 3.
wa_alv_field-fieldname = 'note'.
wa_alv_field-seltext_m = 'notes'.
append wa_alv_field to wa_alv_fieldcat.

*调用alv显示表单数据 
call function 'reuse_alv_list_display'
 exporting 
*   i_interface_check              = ' ' 
*   i_bypassing_buffer             =
*   i_buffer_active                = ' ' 
*   i_callback_program             = ' ' 
*   i_callback_pf_status_set       = ' ' 
*   i_callback_user_command        = ' ' 
*   i_structure_name               =
*   is_layout                      =
    it_fieldcat                    = wa_alv_fieldcat
*   it_excluding                   =
*   it_special_groups              =
*   it_sort                        =
*   it_filter                      =
*   is_sel_hide                    =
*   i_default                      = 'x' 
*   i_save                         = ' ' 
*   is_variant                     =
*   it_events                      =
*   it_event_exit                  =
*   is_print                       =
*   is_reprep_id                   =
*   i_screen_start_column          = 0
*   i_screen_start_line            = 0
*   i_screen_end_column            = 0
*   i_screen_end_line              = 0
* importing
*   e_exit_caused_by_caller        =
*   es_exit_caused_by_user         =
 tables
    t_outtab                       = wa_spfli
 exceptions
    program_error                  = 1
    others                         = 2.

if sy-subrc <> 0.
* message id sy-msgid type sy-msgty number sy-msgno
*         with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
endif.
