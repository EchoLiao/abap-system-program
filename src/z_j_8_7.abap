REPORT Z_J_8_7.
" 8.7 ALV TREE 的使用
DATA: OK_CODE TYPE SY-UCOMM,
      SAVE_OK TYPE SY-UCOMM.
DATA: GB_FIELDCAT TYPE LVC_T_FCAT.
DATA: GB_SORTFLD TYPE LVC_T_SORT.
DATA WA_SPFLI TYPE TABLE OF SPFLI.
SELECT * INTO TABLE WA_SPFLI FROM SPFLI.

DATA: WA_CONTAINER TYPE SCRFNAME VALUE 'ALVDATA',
      ALV_GRID TYPE REF TO CL_GUI_ALV_TREE_SIMPLE,  " not cl_gui_alv_grid!
      WA_CUSTOM_CONTAINER TYPE REF TO CL_GUI_CUSTOM_CONTAINER.

CALL SCREEN 100.


*&---------------------------------------------------------------------*
*&      MODULE  STATUS_0100  OUTPUT *       TEXT
*----------------------------------------------------------------------*
MODULE STATUS_0100 OUTPUT.
  " SET PF-STATUS 'STATUS1'.
  IF WA_CUSTOM_CONTAINER IS INITIAL.
    DATA LS_LIST_COMM TYPE SLIS_T_LISTHEADER.
    DATA LS_ALIST_COMM TYPE SLIS_LISTHEADER.
    LS_ALIST_COMM-TYP = 'H'.
    LS_ALIST_COMM-INFO = 'MY ALV TREE TESTING'.
    APPEND LS_ALIST_COMM TO LS_LIST_COMM.

    PERFORM BLDCAT.
    PERFORM BLDSORTFLD.

    CREATE OBJECT WA_CUSTOM_CONTAINER
      EXPORTING CONTAINER_NAME = WA_CONTAINER.
    CREATE OBJECT ALV_GRID
      EXPORTING I_PARENT = WA_CUSTOM_CONTAINER.
    CALL METHOD ALV_GRID->SET_TABLE_FOR_FIRST_DISPLAY
      EXPORTING
        IT_LIST_COMMENTARY = LS_LIST_COMM
        I_STRUCTURE_NAME   = 'SPFLI'
      CHANGING
        IT_SORT            = GB_SORTFLD
        IT_FIELDCATALOG    = GB_FIELDCAT
        IT_OUTTAB          = WA_SPFLI.
    CALL METHOD ALV_GRID->EXPAND_TREE
      EXPORTING I_LEVEL = 1.
  ENDIF.
ENDMODULE.                 " STATUS_0100  OUTPUT


*&---------------------------------------------------------------------*
*&      MODULE  USER_COMMAND_0100  INPUT *       TEXT
*----------------------------------------------------------------------*
MODULE USER_COMMAND_0100 INPUT.
  SAVE_OK = OK_CODE.
  CLEAR OK_CODE.
  CASE SAVE_OK.
    WHEN 'EXIT'.
      LEAVE PROGRAM.
  ENDCASE.
ENDMODULE.                 " USER_COMMAND_0100  INPUT


*&---------------------------------------------------------------------*
*&      FORM  BLDCAT *       TEXT
*----------------------------------------------------------------------*
*  -->  P1        TEXT
*  <--  P2        TEXT
*----------------------------------------------------------------------*
FORM BLDCAT.
  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING I_STRUCTURE_NAME = 'SPFLI'
    CHANGING CT_FIELDCAT      = GB_FIELDCAT.

  DATA LS_FLDCAT TYPE LVC_S_FCAT.
  LOOP AT GB_FIELDCAT INTO LS_FLDCAT.
    CASE LS_FLDCAT-FIELDNAME.
      WHEN 'COUNTRYFR' OR 'CITYFROM' OR 'COUNTRYTO'
           OR 'CITYTO' OR 'DISTANCE'.
        LS_FLDCAT-OUTPUTLEN = 15.
      WHEN OTHERS.
        LS_FLDCAT-NO_OUT = 'X'.
    ENDCASE.
    IF LS_FLDCAT-FIELDNAME = 'DISTANCE'.
      LS_FLDCAT-DO_SUM = 'X'. " 计算总距离 
    ENDIF.
    MODIFY GB_FIELDCAT FROM LS_FLDCAT.
  ENDLOOP.
ENDFORM.                    " BLDCAT


*&---------------------------------------------------------------------*
*&      FORM  BLDSORTFLD *       TEXT
*----------------------------------------------------------------------*
*  -->  P1        TEXT
*  <--  P2        TEXT
*----------------------------------------------------------------------*
FORM BLDSORTFLD . " 层次关系 
  DATA LS_SORTFLD TYPE LVC_S_SORT.
  LS_SORTFLD-SPOS = 1.
  LS_SORTFLD-FIELDNAME = 'COUNTRYFR'. " 国家 
  LS_SORTFLD-UP = 'X'.
  LS_SORTFLD-SUBTOT = 'X'.
  APPEND LS_SORTFLD TO GB_SORTFLD.

  LS_SORTFLD-SPOS = 2.
  LS_SORTFLD-FIELDNAME = 'CARRID'. " 航线 
  LS_SORTFLD-UP = 'X'.
  LS_SORTFLD-SUBTOT = 'X'.
  APPEND LS_SORTFLD TO GB_SORTFLD.

  LS_SORTFLD-SPOS = 3.
  LS_SORTFLD-FIELDNAME = 'CONNID'. " 航班 
  LS_SORTFLD-UP = 'X'.
  LS_SORTFLD-SUBTOT = 'X'.
  APPEND LS_SORTFLD TO GB_SORTFLD.
ENDFORM.                    " BLDSORTFLD
