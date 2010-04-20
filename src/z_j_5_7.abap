report  z_j_5_7.

start-of-selection.
*设置已使用的状态条
  set pf-status 'sta1'.
  write: 'testting tool bar'.

at user-command.
*当单击按钮时输出
  case sy-ucomm.
    when 'ownsel'.
      if sy-lsind = 1.
        set pf-status 'sta6'.
*定义子窗口并输出
        window starting at 10 10 ending at 30 20.
        write 'out put in the subwindow'.
        write: 'place note!'.
      endif.
  endcase.
