
use ST
create index StuIndex on Student(Sno)
go

create unique index CouIndex on Course(Cno)
go

create unique index SCIndex on SC(Sno asc, Cno desc)
go