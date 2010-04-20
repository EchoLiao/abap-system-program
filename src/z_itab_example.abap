report z_itab_example .
* define internal tables
data: begin of address,
      street(20) type c,
      city(20)   type c,
      end of address.

 types address_tab like standard table of address with non-unique key city.
data: begin of company,
      name(25) type c,
      addresses type address_tab,
      end of company.
data company_tab like hashed table of company with unique key name.
"data company_sorted_tab like sorted table of company
"with unique key name.

data idx type sy-tabix. " @@@@@

* filling internal tables

company-name = 'jacky computer pte ltd'.

address-street = 'alexandra street '.
address-city = 'sinagnore'.
append address to company-addresses.

address-street = 'havelock avenue '.
address-city = 'new york'.
append address to company-addresses.
insert company into table company_tab.
clear company.


company-name = 'beijing caoya co. ltd'.
address-street = 'tian an men square'.
address-city = 'beijing'.
append address to company-addresses.

address-street = 'nanjing road'.
address-city = 'shanghai'.
append address to company-addresses.

address-street = 'wangfujing street'.
address-city = 'beijing'.
append address to company-addresses.

* reading internal tables
" read table company_tab into company.
    " with table key name = 'jacky computer pte ltd' into company.

write / company-name.

loop at company-addresses into address.
write: / sy-tabix,address-street,address-city.
endloop.

* modifying internal tables
