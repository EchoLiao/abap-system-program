report  ytest002.

start-of-selection.
*设置已使用的状态条
  set pf-status 'sta1'.
  write: 'test tool bar'.

at user-command.
*当单击按钮时输出
  case sy-ucomm.
    when 'ownsel'.
      write: 'had selected!'.
  endcase.
