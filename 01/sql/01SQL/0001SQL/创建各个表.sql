
use jigongshetuan
create table JGong
	(jghao char(5) not null primary key,
	xming char(8) not null ,
	nling smallint not null,
	xbie char(2)
	)
go

create table SHTTi
	(bhao char(5) not null primary key,
	mcheng char(20) not null ,
	fzren char(5) not null foreign key references jgong(jghao),
	hddding varchar(30) not null
	)
go

create table CJia
	(jghao char(5) not null foreign key  references JGong(jghao),
	bhao char(5) not null foreign key references shtti(bhao),
	cjrqi smalldatetime not null,
	primary key (jghao, bhao),
	--foreign key jghao references JGong(jghao),
	--foreign key bhao references shtti(bhao)
	)
go

	