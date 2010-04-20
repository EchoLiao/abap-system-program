report z_o_move_corresponding_4_7.
data:   begin of add_personel,
            title(5) type c value 'mr',
            name(20) type c, 
            street(100) type c,
            no(3) type n,
            postcode(6) type n,
        end of add_personel.

data:   begin of add_company,
            position(20) value 'consultant',
            name(20) value 'jack',
            street(100) type c value 'beijing avenue',
            no(3) type n value '002',
            op(1) type c, " 打印时起间隔作用
            postcode(6) type n value '10075',
        end of add_company.

move-corresponding add_company to add_personel. " 自动对结构成员进行匹配赋值

write: / add_personel, add_company right-justified .
write: / add_personel-title.
