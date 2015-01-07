# Create a table for athletics, extra insert to populate it
# elliot.voris.me

create table tbl_athletic
(
athletic_id   smallint    unsigned not null auto_increment comment 'PK: Unique Athletic ID',
athletic_name varchar(15) not null comment 'Sport name with first letter capital',

primary key (athletic_id)
)
;

insert into tbl_athletic
	values
	(NULL, 'Basketball'),
	(NULL, 'Baseball'),
	(NULL, 'Volleyball'),
	(NULL, 'Soccer'),
	(NULL, 'Cross Country')
	;