REPORT Z_J_8_2.
" 8.2	�Զ�������ֶε� ALV �ؼ�ʵ��
*ALVʹ�õ������
TYPE-POOLS: SLIS.
*һ������
DATA WA_ALV_FIELD TYPE SLIS_FIELDCAT_ALV.
*�������ڱ����嵥 
DATA WA_ALV_FIELDCAT TYPE SLIS_T_FIELDCAT_ALV.
*�����ڱ�
DATA WA_SPFLI LIKE TABLE OF YZHHZ WITH HEADER LINE.
*�ڱ�ֵ
SELECT * INTO TABLE WA_SPFLI FROM YZHHZ. 

*�����1����3���ֶ�
WA_ALV_FIELD-COL_POS = 1. " �ڼ���? 
WA_ALV_FIELD-FIELDNAME = 'ID'.
WA_ALV_FIELD-SELTEXT_M = 'ID-NUMBER'.
APPEND WA_ALV_FIELD TO WA_ALV_FIELDCAT.

WA_ALV_FIELD-COL_POS = 2.
WA_ALV_FIELD-FIELDNAME = 'CHA'.
WA_ALV_FIELD-SELTEXT_M = 'NAME'.
APPEND WA_ALV_FIELD TO WA_ALV_FIELDCAT.

WA_ALV_FIELD-COL_POS = 3.
WA_ALV_FIELD-FIELDNAME = 'NOTE'.
WA_ALV_FIELD-SELTEXT_M = 'NOTES'.
APPEND WA_ALV_FIELD TO WA_ALV_FIELDCAT.

*����ALV��ʾ������ 
CALL FUNCTION 'REUSE_ALV_LIST_DISPLAY'
 EXPORTING 
*   I_INTERFACE_CHECK              = ' ' 
*   I_BYPASSING_BUFFER             =
*   I_BUFFER_ACTIVE                = ' ' 
*   I_CALLBACK_PROGRAM             = ' ' 
*   I_CALLBACK_PF_STATUS_SET       = ' ' 
*   I_CALLBACK_USER_COMMAND        = ' ' 
*   I_STRUCTURE_NAME               =
*   IS_LAYOUT                      =
    IT_FIELDCAT                    = WA_ALV_FIELDCAT
*   IT_EXCLUDING                   =
*   IT_SPECIAL_GROUPS              =
*   IT_SORT                        =
*   IT_FILTER                      =
*   IS_SEL_HIDE                    =
*   I_DEFAULT                      = 'X' 
*   I_SAVE                         = ' ' 
*   IS_VARIANT                     =
*   IT_EVENTS                      =
*   IT_EVENT_EXIT                  =
*   IS_PRINT                       =
*   IS_REPREP_ID                   =
*   I_SCREEN_START_COLUMN          = 0
*   I_SCREEN_START_LINE            = 0
*   I_SCREEN_END_COLUMN            = 0
*   I_SCREEN_END_LINE              = 0
* IMPORTING
*   E_EXIT_CAUSED_BY_CALLER        =
*   ES_EXIT_CAUSED_BY_USER         =
 TABLES
    T_OUTTAB                       = WA_SPFLI
 EXCEPTIONS
    PROGRAM_ERROR                  = 1
    OTHERS                         = 2.

IF SY-SUBRC <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
ENDIF.
