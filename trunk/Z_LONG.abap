report z_long .
*defining internal tables

data:begin of address,
       street(20) type c,
       city(20) type c,
     end of address.

types address_tab like standard table of address
    with non-unique key city.
             " with unique key city.  " only for hashed table

data: begin of company,
       name(25) type c,
       addresses type address_tab,
      end of company.

data company_tab like hashed table
                 of company
                  with unique key name.

data company_sorted_tab like sorted table
                 of company
                  with unique key name.

data idx type sy-tabix.

*filling internal tables

company-name = 'jacky computer pte ltd'.

address-street = 'alexandra street'.
address-city = 'sinagpore'.
append address to company-addresses.

address-street = 'havelock avenue'.
address-city = 'new york'.
append address to company-addresses.

insert company into table company_tab.

clear company.

company-name = 'beijing caoya co.ltd'.

address-street = 'tian an men square'.
address-city = 'beijing'.
append address to company-addresses.

address-street = 'nanjing road'.
address-city = 'shang hai'.
append address to company-addresses.

address-street = 'wangfujing street'.
address-city = 'beijing'.
append address to company-addresses.

insert company into table company_tab.


*reading internal tables

read table company_tab
     with table key name = 'jacky computer pte ltd'
     into company.

write: / company-name.

loop at company-addresses into address.
  write: / sy-tabix,address-street,address-city.
endloop.


*modifying internal tables

address-street = 'tian he road'.
address-city = 'beijing'.

read table company_tab
     with table key name = 'beijing caoya co.ltd'
     into company.

read table company-addresses transporting no fields with
  table key city = address-city.

idx = sy-tabix.

modify company-addresses from address index idx.

modify table company_tab from company.


*moving and sorting internal tables

company_sorted_tab = company_tab.


loop at company_sorted_tab into company.
  write / company-name.
   sort company-addresses.
   loop at company-addresses into address.
       write: / sy-tabix,address-street,address-city.
   endloop.
endloop.
