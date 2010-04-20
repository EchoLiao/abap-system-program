report z_j_6_8.
tables sscrfields.
data done(2) type c.

selection-screen:
begin of screen 500 title tit,
      begin of line,
            pushbutton 2(10) s1 user-command C1, " C1 必须是大写字母
            pushbutton 15(10) s2 user-command C2,
      end of line,
end of screen 500.

at selection-screen.
    case sscrfields-ucomm.
        when 'C1'.
            done = 'c1'.
        when 'C2'.
            done = 'c2'.
    endcase.
    leave to screen 0. " 转换到屏幕0 

start-of-selection.
    call screen 500.
    write: 'you have pressed:', done.

initialization.
    s1 = 'button1'.
    s2 = 'button2'.
    tit = 'button even'.
