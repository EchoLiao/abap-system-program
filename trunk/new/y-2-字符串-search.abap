report z_o_4_19.
data: string(30) type c value 'this is a testing sentence.'.
write: / 'searched', 'sy-subrc', 'sy-fdpos'.

search string for 'x'. " 在string中查找字串: x, 忽略尾部空格
write: / 'x ', " under 'sy-subrc': 在sy-subrc 正下方输出. 
    sy-subrc under 'sy-subrc', " 找到, sy-subrc返回0; 反之, 返回4. 
    sy-fdpos under 'sy-fdpos'. 

search string for '.e .'. " 在string中查找字串: e, 不忽略尾部空格  
write: / '.e .',
    sy-subrc under 'sy-subrc',
    sy-fdpos under 'sy-fdpos'. 

search string for 'e '.
write: / 'e ',
    sy-subrc under 'sy-subrc',
    sy-fdpos under 'sy-fdpos'.  " 返回第一个出现的 

search string for '*e'. " 查找以e结尾的单词! 
write: / '*e',
    sy-subrc under 'sy-subrc',
    sy-fdpos under 'sy-fdpos'.  " 返回第一个出现的 

search string for 'i*'. " 查找以i开始的单词! 
write: / 'i*',
    sy-subrc under 'sy-subrc',
    sy-fdpos under 'sy-fdpos'.  " 返回第一个出现的 

while sy-subrc = 0. " 替换. 
    replace 'e' with '-' into string.
endwhile.
write: / string.

data:   len type i.
len = strlen( string ). " len = strlen(string). 错误 !!!!!
write: / 'lenght of', string, 'is', len.

data: f1(8) value 'abcdefgh',
      f2(20) value '12345678901234567890'.
f2+6(5) = f1+3(3).
write: / f2. " f2变为: 123456def  234567890 
